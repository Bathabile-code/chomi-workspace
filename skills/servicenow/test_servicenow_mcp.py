#!/usr/bin/env python3
"""
Test suite for ServiceNow MCP Integration.

Run with: python -m pytest test_servicenow_mcp.py -v
Or: python test_servicenow_mcp.py
"""

import unittest
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime, timedelta
import sys
import os

# Add parent to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from servicenow_mcp import (
    ServiceNowMCP,
    ServiceNowConfig,
    ServiceNowMCPError,
    ConnectionError,
    RecordExistsError,
    WatermarkDetectedError,
)


class TestServiceNowConfig(unittest.TestCase):
    """Test configuration loading."""
    
    def test_from_env_file(self):
        """Test loading config from env file."""
        with patch("builtins.open", unittest.mock.mock_open(read_data="""
SERVICENOW_INSTANCE_URL=https://dev228466.service-now.com/
SERVICENOW_USERNAME=admin
SERVICENOW_PASSWORD=secret123
""")):
            config = ServiceNowConfig.from_env_file("/fake/path.env")
        
        self.assertEqual(config.instance, "dev228466")
        self.assertEqual(config.username, "admin")
        self.assertEqual(config.password, "secret123")
        self.assertEqual(config.base_url, "https://dev228466.service-now.com")


class TestWatermarkDetection(unittest.TestCase):
    """Test email loop prevention / watermark detection."""
    
    def setUp(self):
        self.mcp = ServiceNowMCP.__new__(ServiceNowMCP)
        self.mcp.config = Mock()
    
    def test_detect_auto_submitted_header(self):
        """Detect auto-submitted header."""
        headers = {"auto-submitted": "auto-replied"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_precedence_bulk(self):
        """Detect precedence: bulk header."""
        headers = {"precedence": "bulk"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_x_auto_response_suppress(self):
        """Detect x-auto-response-suppress header."""
        headers = {"x-auto-response-suppress": "OOF"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_out_of_office_subject(self):
        """Detect out-of-office in subject."""
        headers = {"subject": "Out of Office - Back on Monday"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_auto_reply_subject(self):
        """Detect auto-reply in subject."""
        headers = {"subject": "Auto-Reply: Re: Your request"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_undeliverable(self):
        """Detect undeliverable bounce."""
        headers = {"subject": "Undeliverable: Original message"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_noreply_address(self):
        """Detect noreply from address."""
        headers = {"from": "noreply@company.com"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_detect_mailer_daemon(self):
        """Detect mailer-daemon."""
        headers = {"from": "mailer-daemon@googlemail.com"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_no_watermark_clean_email(self):
        """Clean email should not trigger."""
        headers = {
            "from": "human@company.com",
            "subject": "Re: Project Update",
            "to": "team@company.com"
        }
        self.assertFalse(self.mcp.detect_watermark(headers))
    
    def test_empty_headers(self):
        """Empty headers should not trigger."""
        self.assertFalse(self.mcp.detect_watermark({}))
        self.assertFalse(self.mcp.detect_watermark(None))
    
    def test_vacation_header_value(self):
        """Detect vacation in header value."""
        headers = {"x-autoreply": "I am on vacation"}
        self.assertTrue(self.mcp.detect_watermark(headers))
    
    def test_get_watermark_reason_header(self):
        """Get reason for watermark detection."""
        headers = {"auto-submitted": "auto-generated"}
        reason = self.mcp.get_watermark_reason(headers)
        self.assertIn("auto-submitted", reason)
    
    def test_get_watermark_reason_none(self):
        """No watermark = no reason."""
        headers = {"from": "human@company.com", "subject": "Hello"}
        reason = self.mcp.get_watermark_reason(headers)
        self.assertIsNone(reason)


class TestDeduplication(unittest.TestCase):
    """Test deduplication logic."""
    
    def setUp(self):
        self.mcp = ServiceNowMCP.__new__(ServiceNowMCP)
        self.mcp.config = Mock()
        self.mcp._client = Mock()
    
    @patch("servicenow_mcp.Client")
    def test_check_duplicate_found(self, mock_client_class):
        """Should return existing record when duplicate found."""
        mock_resource = Mock()
        mock_response = Mock()
        mock_response.all.return_value = [{
            "sys_id": "abc123",
            "subject": "Test Subject",
            "sys_created_on": "2024-01-01 12:00:00"
        }]
        mock_resource.get.return_value = mock_response
        mock_client_class.return_value.resource.return_value = mock_resource
        
        mcp = ServiceNowMCP()
        mcp._client = mock_client_class.return_value
        
        result = mcp.check_duplicate("sys_email", "subject", "Test Subject")
        
        self.assertIsNotNone(result)
        self.assertEqual(result["sys_id"], "abc123")
    
    @patch("servicenow_mcp.Client")
    def test_check_duplicate_not_found(self, mock_client_class):
        """Should return None when no duplicate."""
        import pysnow
        mock_resource = Mock()
        mock_resource.get.side_effect = pysnow.exceptions.NoResults()
        mock_client_class.return_value.resource.return_value = mock_resource
        
        mcp = ServiceNowMCP()
        mcp._client = mock_client_class.return_value
        
        result = mcp.check_duplicate("sys_email", "subject", "Unique Subject")
        
        self.assertIsNone(result)
    
    def test_generate_fingerprint(self):
        """Test fingerprint generation."""
        data = {"subject": "Hello", "recipient": "test@example.com", "body": "Content"}
        fp1 = self.mcp.generate_fingerprint(data, ["subject", "recipient"])
        fp2 = self.mcp.generate_fingerprint(data, ["subject", "recipient"])
        fp3 = self.mcp.generate_fingerprint(
            {"subject": "Hello", "recipient": "other@example.com"},
            ["subject", "recipient"]
        )
        
        self.assertEqual(fp1, fp2)  # Same data = same fingerprint
        self.assertNotEqual(fp1, fp3)  # Different data = different fingerprint


class TestHealthCheck(unittest.TestCase):
    """Test health check functionality."""
    
    @patch("servicenow_mcp.Client")
    def test_health_check_success(self, mock_client_class):
        """Healthy connection returns connected=True."""
        mock_resource = Mock()
        mock_response = Mock()
        mock_response.all.return_value = [{"value": "dev228466"}]
        mock_resource.get.return_value = mock_response
        
        mock_session = Mock()
        mock_session.get.return_value = Mock(status_code=200)
        
        mock_client = Mock()
        mock_client.resource.return_value = mock_resource
        mock_client.session = mock_session
        mock_client_class.return_value = mock_client
        
        mcp = ServiceNowMCP()
        result = mcp.health_check()
        
        self.assertTrue(result["connected"])
        self.assertEqual(result["status"], "healthy")
    
    @patch("servicenow_mcp.Client")
    def test_health_check_failure(self, mock_client_class):
        """Failed connection raises ConnectionError."""
        mock_client_class.side_effect = Exception("Connection refused")
        
        mcp = ServiceNowMCP()
        with self.assertRaises(ConnectionError):
            mcp.health_check()


class TestCreateRecord(unittest.TestCase):
    """Test record creation with dedup and watermark."""
    
    @patch("servicenow_mcp.Client")
    def test_create_record_success(self, mock_client_class):
        """Successfully create a record."""
        mock_resource = Mock()
        mock_response = Mock()
        # Simulate a dict-like response (pysnow returns dict-like objects)
        mock_response.keys.return_value = iter(["sys_id", "number"])
        mock_response.__getitem__ = Mock(side_effect=lambda k: {"sys_id": "new123", "number": "INC001"}[k])
        mock_response.__iter__ = Mock(return_value=iter([("sys_id", "new123"), ("number", "INC001")]))
        mock_response.__contains__ = Mock(return_value=True)
        mock_resource.create.return_value = mock_response
        
        mock_client = Mock()
        mock_client.resource.return_value = mock_resource
        mock_client_class.return_value = mock_client
        
        mcp = ServiceNowMCP()
        mcp._client = mock_client
        
        # Mock dedup to not find anything
        mcp.check_duplicate = Mock(return_value=None)
        
        result = mcp.create_record("incident", {
            "short_description": "Test",
            "caller_id": "admin"
        })
        
        self.assertEqual(result["sys_id"], "new123")
    
    @patch("servicenow_mcp.Client")
    def test_create_record_duplicate_raises(self, mock_client_class):
        """Should raise RecordExistsError when duplicate detected."""
        mcp = ServiceNowMCP()
        mcp._client = Mock()
        mcp.check_duplicate = Mock(return_value={"sys_id": "existing123"})
        
        with self.assertRaises(RecordExistsError):
            mcp.create_record(
                "sys_email",
                {"subject": "Duplicate", "recipient": "test@test.com"},
                dedup_field="subject"
            )
    
    @patch("servicenow_mcp.Client")
    def test_create_record_watermark_raises(self, mock_client_class):
        """Should raise WatermarkDetectedError for auto-reply."""
        mcp = ServiceNowMCP()
        mcp._client = Mock()
        mcp.check_duplicate = Mock(return_value=None)
        
        with self.assertRaises(WatermarkDetectedError):
            mcp.create_record(
                "sys_email",
                {"subject": "Hello", "recipient": "test@test.com"},
                check_watermark=True,
                watermark_data={"auto-submitted": "auto-replied"}
            )


class TestGetEmails(unittest.TestCase):
    """Test email fetching from sys_email."""
    
    @patch("servicenow_mcp.Client")
    def test_get_emails_basic(self, mock_client_class):
        """Fetch emails with default params."""
        mock_resource = Mock()
        mock_response = Mock()
        mock_response.all.return_value = [
            {"sys_id": "1", "subject": "Email 1", "recipient": "a@test.com"},
            {"sys_id": "2", "subject": "Email 2", "recipient": "b@test.com"},
        ]
        mock_resource.get.return_value = mock_response
        
        mock_client = Mock()
        mock_client.resource.return_value = mock_resource
        mock_client_class.return_value = mock_client
        
        mcp = ServiceNowMCP()
        mcp._client = mock_client
        mcp._connection_status = {"connected": True}  # Skip health check
        
        emails = mcp.get_emails(limit=2)
        
        self.assertEqual(len(emails), 2)
        self.assertEqual(emails[0]["subject"], "Email 1")
    
    @patch("servicenow_mcp.Client")
    def test_get_emails_with_filters(self, mock_client_class):
        """Fetch emails with type filter."""
        mock_resource = Mock()
        mock_response = Mock()
        mock_response.all.return_value = []
        mock_resource.get.return_value = mock_response
        
        mock_client = Mock()
        mock_client.resource.return_value = mock_resource
        mock_client_class.return_value = mock_client
        
        mcp = ServiceNowMCP()
        mcp._client = mock_client
        mcp._connection_status = {"connected": True}
        
        emails = mcp.get_emails(limit=5, filters={"type": "received"})
        
        # Verify the call was made with filter
        call_args = mock_resource.get.call_args
        params = call_args[1]["parameters"]
        self.assertIn("sysparm_query", params)
        self.assertIn("type=received", params["sysparm_query"])


class TestIntegrationHelpers(unittest.TestCase):
    """Test helper methods."""
    
    def test_create_email_helper(self):
        """Test create_email wrapper."""
        with patch.object(ServiceNowMCP, "create_record") as mock_create:
            mock_create.return_value = {"sys_id": "email123"}
            
            mcp = ServiceNowMCP.__new__(ServiceNowMCP)
            mcp.config = Mock()
            
            result = mcp.create_email(
                recipient="test@test.com",
                subject="Hello",
                body="World"
            )
            
            mock_create.assert_called_once()
            call_kwargs = mock_create.call_args[1]
            self.assertEqual(call_kwargs["table"], "sys_email")
            self.assertEqual(call_kwargs["data"]["recipient"], "test@test.com")
            self.assertEqual(call_kwargs["dedup_field"], "subject")
            self.assertTrue(call_kwargs["check_watermark"])
    
    def test_create_incident_helper(self):
        """Test create_incident wrapper."""
        with patch.object(ServiceNowMCP, "create_record") as mock_create:
            mock_create.return_value = {"sys_id": "inc123", "number": "INC001"}
            
            mcp = ServiceNowMCP.__new__(ServiceNowMCP)
            mcp.config = Mock()
            
            result = mcp.create_incident(
                short_description="Something broke",
                caller="admin",
                priority=2
            )
            
            mock_create.assert_called_once()
            call_kwargs = mock_create.call_args[1]
            self.assertEqual(call_kwargs["table"], "incident")
            self.assertEqual(call_kwargs["data"]["short_description"], "Something broke")
            self.assertEqual(call_kwargs["data"]["priority"], 2)


def run_tests():
    """Run all tests."""
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    # Add all test classes
    suite.addTests(loader.loadTestsFromTestCase(TestServiceNowConfig))
    suite.addTests(loader.loadTestsFromTestCase(TestWatermarkDetection))
    suite.addTests(loader.loadTestsFromTestCase(TestDeduplication))
    suite.addTests(loader.loadTestsFromTestCase(TestHealthCheck))
    suite.addTests(loader.loadTestsFromTestCase(TestCreateRecord))
    suite.addTests(loader.loadTestsFromTestCase(TestGetEmails))
    suite.addTests(loader.loadTestsFromTestCase(TestIntegrationHelpers))
    
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    return result.wasSuccessful()


if __name__ == "__main__":
    success = run_tests()
    sys.exit(0 if success else 1)
