# ServiceNow MCP Integration

Core ServiceNow integration module for OpenClaw MCP.

## Features

- **Health Check**: Verify ServiceNow connection and instance status
- **Get Emails**: Fetch records from `sys_email` table with filtering
- **Create Records**: POST new emails/Incidents to ServiceNow
- **Deduplication**: Check for existing records before creating
- **Watermark Detection**: Prevent email loops by checking auto-reply headers

## Setup

Requires `pysnow`:
```bash
pip install pysnow
```

Credentials are read from `~/.openclaw/workspace/servicenow.env`.

## Usage

```python
from servicenow_mcp import ServiceNowMCP

mcp = ServiceNowMCP()

# Health check
mcp.health_check()

# Get emails
emails = mcp.get_emails(limit=10, filters={"type": "received"})

# Create incident (with deduplication)
result = mcp.create_record("incident", {
    "short_description": "Test incident",
    "caller_id": "admin"
}, dedup_field="short_description")
```
