# EP02 May 10 Assets Inventory

## Screenshots Available

### From ChomiVaultSetup/ep02-recording/ (May 10, 21:20)
1. **before_sys_email.png** (72K) — sys_email table BEFORE injection (2,250 records, send-ready type)
2. **email_record_form.png** (275K) — Individual email record form view

### From workspace/ep02-demo/screenshots/ (May 17-18)
3. **before_sys_email_may10.png** (72K) — Same as above, copied to workspace
4. **email_record_form_may10.png** (275K) — Same as above, copied to workspace
5. **servicenow-after-login.png** (261K) — ServiceNow logged in state
6. **servicenow-after-login-correct.png** (267K) — ServiceNow logged in (correct view)
7. **servicenow-business-rule.png** (36K) — Business rule configuration
8. **servicenow-logged-in-sys-email.png** (2.1K) — sys_email table view (appears blank/white)
9. **servicenow-after-mfa-*.png** (multiple, ~259K each) — MFA verification codes

### From workspace/ (May 10)
10. **before_sys_email.png** (72K) — sys_email table
11. **after_sys_email.png** (71K) — sys_email table AFTER injection
12. **servicenow-sys-email.png** — sys_email table view
13. **servicenow-final.png** — Final state screenshot
14. **our_emails.png** — Email records

## Videos Available

### From ChomiVaultSetup/ep02-recording/
1. **real_demo.mp4** (673K) — Main demo video (~45 seconds)
2. **real_demo_with_windows.mp4** (691K) — Demo with windows (~25 seconds)
3. **stage1.mp4** (261B) — Stage 1 video (very small, likely just a frame)

## Terminal Recordings (.cast files)

### From ChomiVaultSetup/ep02-recording/compiled/
1. **stage1.cast** (568B) — Initial setup
2. **stage1_2_demo.cast** (1KB) — Demo flow
3. **stage1_2_final.cast** (2KB) — Final version
4. **stage1_2_technical.cast** (35KB) — **Email ingestion + MCP injection**
5. **stage3_qa_verify.cast** (32KB) — **QA Verification (Bhinca-QA1)**
6. **stage4_ritm_create.cast** (70KB) — **RITM Creation (Lakshmi)**
7. **stage5_qa2_verify.cast** (67KB) — **QA2 Verification (Thuluzi)**
8. **stage6_final_audit.cast** (27KB) — **Final Audit**

## Key Missing Assets for New Recording

### Need to capture:
1. **Agent reasoning process** — Show agent thinking/validation steps
2. **CMDB validation** — Show agent checking CMDB before creating records
3. **Independent decision making** — Show agent making choices without human input
4. **"Is this a real incident?" validation** — Show validation logic
5. **ServiceNow incident form** — Show auto-populated fields
6. **Priority assignment logic** — Show how agent determines priority
7. **Assignment group routing** — Show how agent routes to correct team

## Recommended Hybrid Approach

### Part 1: May 10 Footage (re-edited)
- Use: Team spawning, email injection, RITM creation
- Re-narrate with "independent expert agent" language
- Emphasize: Agent assembled team, not just executed tasks

### Part 2: New Recording (focus on reasoning)
- Show: Email arrives → Agent analyzes → Validates → Creates incident
- Highlight: CMDB checks, priority logic, assignment routing
- Emphasize: Independent reasoning, not just execution

### Combined: 5-7 minute demo
- 0:00-0:30: Hook (problem statement)
- 0:30-2:00: Part 1 — May 10 footage (team assembly + execution)
- 2:00-4:00: Part 2 — New recording (reasoning + validation)
- 4:00-5:00: Results + impact
- 5:00-5:30: Outro + call to action
