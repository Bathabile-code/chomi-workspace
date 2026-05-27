# EP02/EP03 — PROPER ARCHITECTURE PLAN (2026-05-25)

## The Problem
We built agents that created FABRICATED test data instead of using the 39 REAL emails in ServiceNow.

## The Correct Flow (REAL DATA ONLY)

### Step 1: Email Injection ✅ (ALREADY DONE)
- **What**: 39 real emails from `chomi-agent@mails.dev` → ServiceNow `sys_email`
- **How**: MCP Bridge polls inbox, ingests via REST API
- **Evidence**: Terminal screenshot showing 39 emails with real dates
- **Status**: ✅ COMPLETE — No action needed

### Step 2: Kwazi Creates RITMs from REAL Emails 🔄 (REDO)
- **What**: Kwazi reads the 39 REAL emails from `sys_email` table
- **How**: Query `sys_email?type=received`, create RITM for each valid email
- **Output**: RITM0010001, RITM0010002, etc. (all linked to real email subjects)
- **Evidence**: ServiceNow screenshot showing RITMs with real subjects
- **Status**: ❌ NEEDS REDO — Previous RITMs were fabricated test data

### Step 3: Escalation Email Arrives about EXISTING RITM 🔄 (REDO)
- **What**: New email arrives: "Escalate RITM0010005 — still not resolved"
- **How**: MCP Bridge injects to `sys_email`, agent detects escalation pattern
- **Key**: References EXISTING RITM (created in Step 2)
- **Status**: ❌ NEEDS REDO — No escalation flow built yet

### Step 4: License/Permission Check 🔄 (NEW)
- **What**: Verify sender has license/permission to escalate
- **How**: Check `user` table, `roles`, `license` fields
- **Agent**: Same or dedicated sub-agent
- **Status**: ❌ NEEDS BUILD

### Step 5: Create Case → Link to EXISTING RITM 🔄 (REDO)
- **What**: Create Case, link to RITM0010005 (NOT create new RITM)
- **How**: `sn_customerservice_case` POST + `task_rel_task` link
- **Key**: Thuluzi finds EXISTING RITM, creates ONLY Case
- **Status**: ❌ NEEDS REDO — Thuluzi currently creates new RITMs

### Step 6: QA Validation (Bhinca) 🔄 (READY TO SPAWN)
- **What**: Verify RITM exists, Case linked, permissions checked
- **How**: Query ServiceNow, validate relationships
- **Status**: ⏳ Ready to spawn after Steps 2-5

## Documentation Requirements
- [ ] Screenshot/clip of Step 1: Real emails in sys_email
- [ ] Screenshot/clip of Step 2: Kwazi creating RITMs from real emails
- [ ] Screenshot/clip of Step 3: Escalation email detected
- [ ] Screenshot/clip of Step 4: License check result
- [ ] Screenshot/clip of Step 5: Case created + linked to existing RITM
- [ ] Screenshot/clip of Step 6: QA validation report
- [ ] Terminal recording of each step
- [ ] ServiceNow UI proof for each step

## Execution Order
1. Fix Kwazi to create RITMs from REAL emails (not fabricated data)
2. Build escalation detection (email references existing RITM)
3. Build license/permission check agent
4. Fix Thuluzi to work with EXISTING RITMs (not create new ones)
5. Spawn Bhinca for QA
6. Document every step with screenshots/clips
