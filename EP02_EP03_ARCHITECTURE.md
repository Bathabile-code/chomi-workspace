# EP02/EP03 Architecture Brief — Headless ServiceNow with Expert Agent Teams

## Vision

Build a **headless ServiceNow platform** orchestrated by OpenClaw expert agent teams. 

**No UI interaction. No human in the loop. AI agents reason autonomously, validate data, and execute with confidence.**

---

## The Flow (End-to-End)

### Stage 1: Email Ingestion (Headless)
```
External Email → mails.dev (SendClaw) → MCP Bridge → ServiceNow sys_email table
```
- Poll SendClaw inbox every 5 minutes
- Deduplicate (local tracker + ServiceNow check)
- Ingest via ServiceNow REST Table API → `sys_email` (type: `received`)

### Stage 2: Expert Agent Team — Email Analysis (AI Agent in the Loop)
```
sys_email record → Spawn Expert Agent (Lakshmi-Architect) 
  → Read ServiceNow LLM-synthesized docs (github.com/ServiceNow/ServiceNowDocs)
  → Analyze email content, classify, extract fields
  → Validate against CMDB (CIs, services, assignment groups)
  → Route to correct table: incident, ritm, case, or escalation
```

### Stage 3: RITM Creation (Headless)
```
Expert Agent (Kwazi-Developer) 
  → Create RITM in sc_req_item
  → Link to sys_email via u_source_email
  → Set priority based on business rules
  → Set assignment group based on CMDB/service mapping
  → Set state = Open
```

### Stage 4: Escalation Linking (Headless)
```
Escalation Email arrives → Expert Agent (Thuluzi-ServiceDesk)
  → Check if related RITM exists (match by subject, CI, or sender)
  → If found: Create new Case, link to existing RITM
  → If not found: Create new RITM + Case, link them
  → Update parent REQ if needed
```

---

## Expert Agent Team

### 1. Lakshmi-Architect (ServiceNow Platform Architect)
**Role:** Platform knowledge, CSDM, CMDB design, governance
**Expertise:**
- ServiceNow data model (sys_email, incident, sc_req_item, sc_request, sn_customerservice_case)
- CMDB/CSDM relationships
- Assignment group routing
- Priority matrix (business impact × urgency)
**Knowledge:** github.com/ServiceNow/ServiceNowDocs (LLM-synthesized)

### 2. Kwazi-Developer (ServiceNow Integration Developer)
**Role:** API design, REST integration, table APIs, business rules
**Expertise:**
- ServiceNow Table API (GET/POST/PATCH)
- sys_email → RITM transformation logic
- Field mapping, data validation
- Error handling, retry logic
**Knowledge:** API implementation docs, Table API reference

### 3. Bhinca-QA (Quality Assurance Engineer)
**Role:** Validation, verification, regression testing
**Expertise:**
- Verify sys_email records exist and are correct
- Verify RITMs created with correct fields
- Verify escalation linking (RITM ↔ Case)
- Audit trail completeness
**Approach:** Independent validation after every stage

### 4. Thuluzi-ServiceDesk (Service Desk / Business Analyst)
**Role:** Business rules, escalation handling, case management
**Expertise:**
- Email classification (incident vs request vs case vs escalation)
- Business priority rules
- Assignment group mapping
- Escalation workflow logic
**Knowledge:** ITSM/CSM best practices

### 5. Chomi-Orchestrator (Main Agent)
**Role:** Spawn experts, coordinate handoffs, manage state, report results
**Expertise:**
- OpenClaw sub-agent spawning
- Context injection (docs, CMDB, business rules)
- Session management
- Final reporting and audit

---

## The "AI Agent in the Loop" (No Human in the Loop)

**Old paradigm:** Human reviews every email → Human creates record → Human assigns → Human escalates

**New paradigm:** 
```
Email arrives → AI Agent Team reasons → Validates → Executes → Reports
```

**Key difference:**
- AI agents have **platform knowledge** (ServiceNow docs)
- AI agents **validate** against CMDB (no hallucinated tables)
- AI agents **reason** about business rules (priority, assignment)
- AI agents **execute** via APIs (headless)
- AI agents **verify** their own work (QA agent checks every output)

---

## Headless Architecture (No UI)

| Layer | Component | Headless? |
|-------|-----------|-----------|
| Ingestion | MCP Bridge + SendClaw API | ✅ Yes |
| Analysis | AI Expert Agents (Lakshmi) | ✅ Yes |
| Creation | ServiceNow Table API | ✅ Yes |
| Validation | AI QA Agent (Bhinca) | ✅ Yes |
| Escalation | AI Service Desk (Thuluzi) | ✅ Yes |
| Reporting | API queries + Slack/Telegram | ✅ Yes |
| **NO UI** | **Zero browser automation needed** | ✅ **100% Headless** |

---

## Data Model

### Tables Used
1. **sys_email** — Inbound email records
2. **sc_request** — Parent request
3. **sc_req_item** — Request items (RITMs)
4. **sn_customerservice_case** — Customer service cases (escalations)
5. **cmdb_ci_service** — Business services (for validation)
6. **cmdb_rel_ci** — CI relationships
7. **sys_user_group** — Assignment groups

### Key Fields
- `sys_email.u_source_email` → links to RITM
- `sc_req_item.u_source_email` → links back to email
- `sn_customerservice_case.u_ritm` → links case to RITM
- Priority matrix: 1=Critical, 2=High, 3=Medium, 4=Low

---

## Escalation Logic

```
Escalation Email arrives:
  1. Parse email (sender, subject, body)
  2. Search existing RITMs:
     - Match by CI name in subject/body
     - Match by sender email
     - Match by reference number in subject
  3. If RITM found:
     - Create Case linked to RITM
     - Update RITM state if needed
  4. If no RITM found:
     - Create new RITM
     - Create Case linked to new RITM
  5. Notify assignment group (optional)
```

---

## Success Metrics

- **Ingestion rate:** 100% emails ingested (0 lost)
- **Deduplication:** 0 duplicates in ServiceNow
- **RITM creation:** < 30 seconds from email arrival
- **Validation pass rate:** > 99%
- **Escalation linking accuracy:** > 95%
- **Zero human intervention required**

---

## Competitive Angle

**What others say:**
> "AI agents need clean CMDB or they fast-track bad data" (B. Wilson)
> "You need a human in the loop for governance" (Industry)

**What EP02/EP03 shows:**
> "Our AI agents ARE the governance layer. They have platform knowledge. They validate against CMDB. They reason about business rules. They don't fast-track bad data — they clean it before executing. And they don't need a human in the loop because they are the experts."

---

## Next Steps

1. ✅ MFA disabled on ServiceNow
2. ⏳ Spawn expert agents (Lakshmi, Kwazi, Bhinca, Thuluzi)
3. ⏳ Inject ServiceNow docs as knowledge context
4. ⏳ Test email ingestion flow end-to-end
5. ⏳ Build RITM creation logic
6. ⏳ Build escalation linking logic
7. ⏳ QA validation after every stage
8. ⏳ Record demo: Headless agent team in action

---

**Status:** Architecture defined, ready to build 💪
