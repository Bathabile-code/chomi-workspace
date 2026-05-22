# ServiceNow Documentation Reference for AI Agents

**Official Source:** https://github.com/ServiceNow/ServiceNowDocs

**Format:** Markdown, optimized for LLM consumption (no images)

**Updated:** Monthly (last update May 10, 2026)

**Release Family:** Australia (latest)

## Quick Navigation

### Core Modules
- **[Building Applications](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/application-development)** — App dev, scopes, update sets
- **[API Reference](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/api-reference)** — REST, SOAP, GraphQL APIs
- **[IT Operations Management (ITOM)](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/it-operations-management)** — Discovery, CMDB, monitoring
- **[IT Service Management (ITSM)](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/it-service-management)** — Incidents, changes, problems
- **[Platform Administration](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/platform-administration)** — Instance config, users, roles
- **[Platform Security](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/platform-security)** — ACLs, encryption, compliance

### AI & Automation
- **[Intelligent Experiences](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/intelligent-experiences)** — AI features, copilots
- **[Build Workflows](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/build-workflows)** — Workflow automation
- **[Hyperautomation & Low-Code](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/hyperautomation-low-code)** — RPA, low-code tools

### Governance & Architecture
- **[Governance, Risk, Compliance](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/governance-risk-compliance)** — GRC module
- **[Enterprise Architecture](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/application-portfolio-management)** — APM, portfolio management
- **[Cloud Governance Suite](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/cloud-governance-suite)** — Cloud governance

### Industry Solutions
- **[Customer Service Management](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/customer-service-management)** — CSM
- **[Employee Service Management](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/employee-service-management)** — ESM
- **[Field Service Management](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/field-service-management)** — FSM
- **[Healthcare & Life Sciences](https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/healthcare-life-sciences)** — Healthcare solutions

## How to Use This Reference

### For Spawned Agents
When spawning agents to work on ServiceNow tasks:

```bash
# Example: Spawn an agent with ServiceNow docs context
sessions_spawn \
  --task "Build a custom app for incident management" \
  --context "Use https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/application-development for app dev patterns" \
  --context "Use https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/it-service-management for incident management domain knowledge"
```

### For Research
When researching ServiceNow capabilities:
1. Start with the module that matches your domain (ITSM, ITOM, CSM, etc.)
2. Look for `index.md` files — they're the entry points
3. Follow cross-references to related modules
4. Use the glossary for terminology: https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown/glossary

### For Architecture Decisions
When making platform decisions:
1. Check **Platform Administration** for instance-level config
2. Check **Building Applications** for app design patterns
3. Check **Platform Security** for governance constraints
4. Check **Governance, Risk, Compliance** for enterprise policies

## Key Concepts from Docs

### Application Scopes
- **Company-owned scopes:** Can be updated by Build Agent, SDK
- **ServiceNow-owned scopes (HRSD, SecOps, CSM):** Cannot be directly modified
- **Workaround:** Extend in custom scope, use MCP servers for safe updates

### CMDB (Configuration Management Database)
- **System of record** for IT infrastructure
- **Critical for:** AI Control Tower, incident correlation, change impact analysis
- **Hygiene matters:** Stale CIs, guessed relationships = hallucinated governance

### Update Sets
- **Mechanism for:** Deploying changes across instances
- **Governance:** Tracked, auditable, reversible
- **Best practice:** Use scoped apps + update sets, not direct table modifications

### ACLs (Access Control Lists)
- **Granular control:** Table, field, record level
- **Enforcement:** Before read/write/create/delete operations
- **Design:** Principle of least privilege

## Common Patterns

### Building a Custom App
1. Create a scoped application
2. Define tables (extend CMDB if needed)
3. Create forms, lists, workflows
4. Add REST APIs for integrations
5. Use update sets for deployment

### Integrating External Systems
1. Use REST APIs (preferred) or SOAP
2. Create integration user with minimal ACLs
3. Use MCP servers for complex logic
4. Document API contracts

### Automating Processes
1. Use Workflows (visual, low-code)
2. Use Business Rules (server-side logic)
3. Use Client Scripts (UI interactions)
4. Use Flow Designer (newer, recommended)

## Important Constraints

### Build Agent Limitations
- Cannot modify ServiceNow-owned apps directly
- Cannot bypass ACLs or security policies
- Cannot access data outside its scope
- **Workaround:** Use MCP servers + Anthropic Claude for safe updates

### CMDB Governance
- Data quality is foundational for AI Control Tower
- Stale data = unreliable automation
- Relationships must be accurate for impact analysis
- **Best practice:** Treat CMDB as system of record

### Upgrade Safety
- Custom scopes = safe upgrades
- Direct OOTB modifications = upgrade tax
- Update sets = reversible changes
- **Best practice:** OOTB-first, extend in custom scope

## Links for Agents

**Clone the repo:**
```bash
git clone https://github.com/ServiceNow/ServiceNowDocs.git
cd ServiceNowDocs
git checkout australia  # Latest release family
```

**Browse online:**
https://github.com/ServiceNow/ServiceNowDocs/tree/australia/markdown

**Official docs (with images):**
https://www.servicenow.com/docs

## Related Resources

- **ServiceNow Community:** https://community.servicenow.com
- **ServiceNow Developer Program:** https://developer.servicenow.com
- **ServiceNow Knowledge Base:** https://support.servicenow.com
- **ServiceNow YouTube:** https://www.youtube.com/servicenow

---

**Last Updated:** 2026-05-22
**Maintained by:** Chomi
**For:** All spawned agents working on ServiceNow tasks
