# AutoSite SA — Vision & Strategy

## The Big Picture

**The $1T Opportunity:**
> "It's one niche, repeated 10,000 times: boring local businesses who don't know AI exists."
> — Greg, on startups shifting from SaaS to Agent-Native

**The insight:** Local SMBs (dentists, landscapers, pool companies, PT clinics, funeral homes) are still running on dashboards, phone calls, and spreadsheets. They don't know AI exists. That's the opportunity.

---

## The AutoSite SA Pivot

**OLD positioning:** "Build landing pages for small businesses"

**NEW positioning:** "Build AI employees for local businesses who don't know AI exists yet"

### What This Means

Instead of one-time landing pages → recurring AI agent services

### Pricing Model

| Service | Monthly Price | Build Time |
|---------|--------------|------------|
| Missed call text-back | $800-1,500/mo | 3 min |
| Review request automation | $500-1,200/mo | 4 min |
| Appointment no-show recovery | $1,200-2,500/mo | 5 min |
| Intake form → CRM routing | $600-1,000/mo | 6 min |
| **Average client** | **$2,400/mo** | **30 min** |

These clients have never heard of Claude. They just know their phone is ringing and they're losing money.

---

## For Dhiren 🇿🇦

**Who:** Dhiren — Thaby's husband, business partner in AutoSite SA vision

**What we're building:** The technical foundation (AI agents, MCP pipelines, ServiceNow integration) that proves AI agents can work with real business infrastructure.

**Why it matters:** Once the technical foundation is proven, it can be replicated for ANY local business vertical.

---

## The Architecture We're Building

```
Layer 1: Email Inbox (SendClaw/mails.dev)
    ↓
Layer 2: Bridge MCP Server (email → ServiceNow)
    ↓
Layer 3: OpenClaw MCP Server (ServiceNow → Chomi)
    ↓
Layer 4: Chomi (AI Agent / Governor)
    ↓
Layer 5: Outcome (case created, customer notified, workflow complete)
```

This architecture proves AI agents can:
- Monitor business inboxes 24/7
- Create tickets/cases automatically
- Route work to the right people
- Follow up without human intervention

This same pattern applies to:
- Dentist appointment reminders
- Landscaper quote requests
- Pool company service bookings
- Any local business with an inbox

---

## Key Quotes to Remember

> "The $1T isn't in agent-first startups. It's in agent-first SERVICE BUSINESSES selling to people who still use Excel."

> "The first $1B agent-native company in each vertical will look nothing like the SaaS it replaced. Smaller team, higher margins, no implementation cost."

> "Find an industry that still runs on dashboards, phone calls, and spreadsheets. Build the agent-native version. Charge per outcome. Own the workflow end-to-end."

---

## Current Status

| Component | Status |
|-----------|--------|
| Bridge MCP Server | ✅ Built and tested |
| OpenClaw MCP | ✅ 400+ tools ready |
| ServiceNow PDI | ✅ Awake and working |
| Email pipeline | ✅ chomi-agent@mails.dev |
| GitHub repo | ✅ servicenow-ai-agent-series |

## Next Steps

1. Configure OpenClaw MCP to detect emails in ServiceNow
2. Build triage logic (OOO / Reply / New case)
3. Document EP02 for BuildInPublic series
4. Draft preface LinkedIn post
5. Apply same pattern to AutoSite SA client verticals

---

**Mission:** Build AI agents that local businesses pay $2,400/month for — without knowing AI is involved.

*Last updated: 2026-04-21*
