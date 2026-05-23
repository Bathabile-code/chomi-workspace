# Business Analysis: Email-to-ServiceNow Integration

**Analyst:** Zanele (Business Analyst)  
**Date:** 2026-05-17  
**Status:** Requirements Analysis Complete  
**Priority:** High

---

## 1. Executive Summary

This document analyzes the requirements for integrating email communication with ServiceNow to enable automated ticket creation, email processing, and bidirectional communication between end-users and the ServiceNow platform.

**Business Value:**
- Reduce manual ticket creation overhead by ~70%
- Improve response times to email inquiries
- Ensure no email falls through the cracks
- Create audit trail for all email-based incidents/requests

---

## 2. Data Flow Requirements

### 2.1 Email → ServiceNow (Inbound)

| Data Element | Source | Destination Table | Required? | Notes |
|-------------|--------|------------------|-----------|-------|
| **Sender Email** | Email `From` header | `sys_user.email` / `task.email` | Yes | Used for caller identification |
| **Subject Line** | Email `Subject` header | `task.short_description` | Yes | Becomes ticket title |
| **Body Content** | Email body (text/HTML) | `task.description` / `sys_email.body` | Yes | May need HTML stripping |
| **Attachments** | Email attachments | `sys_attachment` | No | File size limits apply |
| **CC Recipients** | Email `CC` header | `task.watch_list` | No | For notification loop |
| **Received Timestamp** | Email `Date` header | `task.opened_at` | Yes | Timezone handling needed |
| **Message-ID** | Email `Message-ID` header | `sys_email.message_id` | Yes | For threading/deduplication |
| **In-Reply-To** | Email `In-Reply-To` header | `sys_email.in_reply_to` | No | For conversation threading |
| **Email Priority** | Email `Priority`/`X-Priority` | `task.priority` | No | Mapping rules needed |
| **Original Email** | Full email source | `sys_email` (retained) | Yes | For audit/legal compliance |

### 2.2 ServiceNow → Email (Outbound)

| Data Element | Source Table | Email Field | Required? | Notes |
|-------------|-------------|-------------|-----------|-------|
| **Recipient** | `task.caller_id` / `task.watch_list` | `To` header | Yes | Dynamic based on assignment |
| **Ticket Number** | `task.number` | Subject prefix | Yes | `[INC0012345]` format |
| **Status Updates** | `task.state` | Body template | Yes | State transition triggers |
| **Work Notes** | `sys_journal_field` | Body / attachment | No | Public vs internal notes |
| **Resolution Notes** | `task.close_notes` | Closure email | Yes | Required for closed tickets |
| **Assignment Changes** | `task.assigned_to` | Notification | No | Reassignment alerts |
| **SLA Breach Warnings** | `task_sla` | Escalation email | No | Time-based triggers |

### 2.3 Metadata & Configuration Data

| Configuration | Purpose | Storage |
|--------------|---------|---------|
| **Email Accounts** | Inbound mailboxes | `sys_email_account` |
| **Routing Rules** | Which emails → which table | `sysevent_email_action` |
| **Filter Conditions** | Spam/filter logic | `sys_filter` |
| **Templates** | Outbound email format | `sys_notification` / `sysevent_email_action` |
| **Watermarking** | Unique ticket reference in replies | `glide.email.watermark` |

---

## 3. Functional Requirements

### 3.1 Inbound Email Processing

**FR-001: Mailbox Monitoring**
- System must poll dedicated mailbox(es) at configurable intervals (default: 5 minutes)
- Support for IMAP/POP3/Exchange protocols
- Support for OAuth2 authentication (modern security standard)

**FR-002: Ticket Auto-Creation**
- New emails create incidents by default
- Configurable table routing (incident, problem, change_request, sc_request)
- Routing based on: recipient address, subject keywords, sender domain

**FR-003: Caller Identification**
- Match sender email to existing `sys_user` records
- Create new user record if no match (configurable)
- Handle "on behalf of" / delegated sending scenarios

**FR-004: Thread Management**
- Replies to existing ticket emails update the same ticket (watermark detection)
- `In-Reply-To` / `References` header matching as fallback
- Prevent duplicate ticket creation for reply emails

**FR-005: Attachment Handling**
- Extract and attach files to ticket (size limit: default 25MB)
- Virus scanning before storage
- Blocked file type filtering (.exe, .zip with macros, etc.)

**FR-006: Body Processing**
- HTML-to-text conversion for clean description field
- Signature stripping (common signatures, disclaimers)
- Quote/thread trimming (remove previous email content)

### 3.2 Outbound Email Notifications

**FR-007: Status Change Notifications**
- Trigger on: New, Work in Progress, Resolved, Closed, Reopened
- Template-based with variable substitution
- Respect user notification preferences

**FR-008: Assignment Notifications**
- Notify assignee when ticket assigned
- Notify previous assignee on reassignment (optional)

**FR-009: SLA Alert Emails**
- Warning at 50%, 75%, 90% of SLA time elapsed
- Escalation to manager on breach

**FR-010: Closure Confirmation**
- Mandatory resolution summary included
- Survey link (optional)
- Reopen instruction (reply to email)

### 3.3 Bidirectional Communication

**FR-011: Email Reply Processing**
- User replies to ticket email → added as work note
- Watermark in subject line enables matching
- Respect "internal" vs "external" note visibility

**FR-012: Command Parsing**
- Special commands in email body: `#close`, `#reassign`, `#priority high`
- Only processed from authorized senders (assignee, manager)

---

## 4. Non-Functional Requirements

### 4.1 Performance

| Metric | Target | Notes |
|--------|--------|-------|
| Email ingestion latency | < 5 minutes | From send to ticket creation |
| Outbound send latency | < 2 minutes | From state change to email sent |
| Concurrent email processing | 50+ emails/minute | Peak load handling |
| Attachment processing | < 30 seconds | Up to 25MB |

### 4.2 Security

- **Authentication:** OAuth2 preferred; basic auth only over TLS
- **Encryption:** TLS 1.2+ for all email transit
- **Data Retention:** Original emails retained per policy (default: 90 days)
- **PII Handling:** Email content scanned for sensitive data; masking rules configurable
- **Spam Filtering:** Integration with enterprise spam solution or built-in filtering

### 4.3 Reliability

- **Redundancy:** Multiple mailbox support with failover
- **Error Handling:** Failed emails to error queue with retry logic (3 attempts)
- **Audit Logging:** All email processing logged in `sys_email` / `syslog`
- **Monitoring:** Alert on mailbox connection failures or processing backlogs

---

## 5. Acceptance Criteria

### 5.1 Must-Have (P0)

- [ ] **AC-001:** Email sent to configured mailbox creates incident within 5 minutes
- [ ] **AC-002:** Ticket subject = email subject (truncated to 160 chars if needed)
- [ ] **AC-003:** Ticket description = email body (HTML stripped, signature removed)
- [ ] **AC-004:** Sender matched to caller; unmatched senders create user or use default
- [ ] **AC-005:** Reply to ticket email (with watermark) adds work note, no new ticket
- [ ] **AC-006:** Status change triggers notification email to caller
- [ ] **AC-007:** Attachments < 10MB successfully attached to ticket
- [ ] **AC-008:** Failed processing emails visible in "Inbound Errors" module

### 5.2 Should-Have (P1)

- [ ] **AC-009:** Multiple mailboxes route to different tables (incident vs request)
- [ ] **AC-010:** Subject keyword routing ("URGENT" → high priority)
- [ ] **AC-011:** CC recipients added to watch list
- [ ] **AC-012:** Command parsing (#close, #reassign) from authorized emails
- [ ] **AC-013:** Custom email templates per category/subcategory
- [ ] **AC-014:** Attachment size limit configurable (up to 25MB)

### 5.3 Nice-to-Have (P2)

- [ ] **AC-015:** AI-powered sentiment analysis → auto-priority adjustment
- [ ] **AC-016:** Auto-categorization based on email content (ML classification)
- [ ] **AC-017:** Calendar invite processing for change requests
- [ ] **AC-018:** Delivery/read receipt tracking
- [ ] **AC-019:** Email thread view within ServiceNow UI

---

## 6. Risk Analysis

### 6.1 High Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| **Email loops** (auto-reply ↔ auto-ticket) | High | High | Detect auto-reply headers; watermark filtering; rate limiting |
| **Spam flood creating tickets** | Medium | High | Spam filtering; sender whitelist/blacklist; rate limiting per sender |
| **Sensitive data in email descriptions** | Medium | High | PII scanning/masking; data loss prevention rules; encryption at rest |
| **Mailbox authentication failure** | Medium | Medium | OAuth2 with refresh token; monitoring alerts; fallback mailbox |
| **Duplicate ticket creation** | Medium | Medium | Robust watermark + Message-ID matching; deduplication window (5 min) |

### 6.2 Medium Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| **Attachment virus infection** | Low | High | Server-side AV scanning; blocked file types; sandbox execution |
| **Email formatting lost** | High | Low | HTML-to-text conversion rules; preserve formatting in journal |
| **Timezone confusion** | Medium | Low | UTC normalization; user timezone display; clear timestamp formatting |
| **Large attachment storage bloat** | Medium | Medium | Size limits; compression; retention policies; external storage option |

### 6.3 Low Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| **Template variable errors** | Medium | Low | Template validation; fallback text; preview function |
| **Unicode/encoding issues** | Low | Low | UTF-8 enforcement; encoding detection; fallback handling |
| **Email client compatibility** | Low | Low | Test major clients (Outlook, Gmail, Apple Mail); plain text fallback |

---

## 7. Assumptions & Dependencies

### 7.1 Assumptions

1. ServiceNow instance has Email plugin enabled (compliant with licensing)
2. Dedicated mailbox(es) available (not personal inboxes)
3. Network allows IMAP/SMTP traffic to ServiceNow instance
4. User base has email as primary communication channel
5. Existing user records have accurate email addresses

### 7.2 Dependencies

| Dependency | Owner | Status |
|-----------|-------|--------|
| Mailbox provisioning | IT / Exchange Admin | Required |
| DNS / MX records (if using custom domain) | IT / Network Admin | Required |
| ServiceNow email plugin license | ServiceNow Admin | Verify |
| Spam filtering solution | Security Team | Recommended |
| User communication (new process) | Change Management | Required |

---

## 8. Recommended Implementation Phases

### Phase 1: MVP (Weeks 1-2)
- Single inbound mailbox → Incident table
- Basic caller matching
- Watermark reply handling
- Status change notifications

### Phase 2: Enhanced Routing (Weeks 3-4)
- Multiple mailboxes / table routing
- Subject keyword rules
- CC → watch list
- Custom templates per category

### Phase 3: Advanced Features (Weeks 5-6)
- Command parsing
- Attachment virus scanning
- SLA alert emails
- Error monitoring dashboard

### Phase 4: Optimization (Weeks 7-8)
- ML-based auto-categorization
- Sentiment analysis
- Performance tuning
- User feedback incorporation

---

## 9. Open Questions

1. **Which email protocol?** IMAP (recommended), POP3, or Microsoft Graph API?
2. **Single or multiple inbound mailboxes?** (e.g., `helpdesk@`, `requests@`, `alerts@`)
3. **User creation policy?** Auto-create unknown senders, or use default "Email User"?
4. **Attachment size limit?** Default 10MB, or higher/lower?
5. **Retention policy?** How long to keep original emails in `sys_email`?
6. **Command email access?** Which roles can send commands (#close, etc.)?
7. **Existing email volume?** Expected emails per day for capacity planning?

---

## 10. Appendix

### A. ServiceNow Native Email Tables
- `sys_email` — All inbound/outbound emails
- `sys_email_account` — Mailbox configurations
- `sysevent_email_action` — Email-triggered actions
- `sys_notification` — Notification definitions
- `sys_email_client` — Email client configurations

### B. Relevant ServiceNow Modules
- System Mailboxes → Inbox / Outbox / Sent
- System Policy → Email → Inbound Actions
- System Policy → Email → Notifications
- System Logs → Email → Inbound Errors

### C. Reference
- ServiceNow Docs: [Inbound Email Actions](https://docs.servicenow.com/bundle/utah-platform-administration/page/administer/email/concept/inbound-email-actions.html)
- ServiceNow Docs: [Email Notifications](https://docs.servicenow.com/bundle/utah-platform-administration/page/administer/email/concept/c_EmailNotifications.html)

---

**Document Version:** 1.0  
**Next Review:** Upon stakeholder feedback  
**Approved By:** [Pending]
