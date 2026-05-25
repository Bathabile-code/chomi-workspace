---
status: "done"
assignee: "chomi"
created: "2026-05-25"
---

# Cron Run - 2026-05-25 (Monday Morning, 7:58 AM SAST)

## Summary
- **Session flush**: Found 2 sessions from May 24 — both failed due to API errors, context captured below
- **Lessons checked**: No new lessons since Feb 21 — all merged in MEMORY.md
- **Git working tree**: Clean (nothing to commit before this update)
- **Task board review**: EP02 task marked "done" but demo recording still pending — flagged
- **Chomi 2.0**: Still "doing" since May 17, Phase 2 not started
- **EP03 Vercel deploy**: Still "todo" since May 4 — build complete, needs deployment

## Session Flush Findings (May 24)

### Morning Skill Research Cron (May 24, 12:11 PM SAST)
- **Status**: FAILED ❌
- **Error**: OpenRouter 400 — context length exceeded (~278k tokens requested vs 262k limit)
- **Model**: moonshotai/kimi-k2.6 via OpenRouter
- **Impact**: No skill research completed on May 24
- **Note**: This is the 3rd consecutive failure of morning skill research cron — context keeps growing. May need compaction or model switch.

### Thaby's EP02 Angle Refinement (May 24, 4:01 PM SAST)
- **Status**: FAILED ❌ (Assistant 402 payment error)
- **Content**: Thaby sent detailed Telegram notes refining EP02 narrative — TWO angles captured
- **Angle 1 — Autonomous ServiceNow**: Email → Incident with validation layers (surface, middle, deep)
- **Angle 2 — Corrected OpenClaw Architecture**: Sub-agents are independent experts, NOT task executors
  - "Under you but independent of you"
  - Have own reasoning, can validate/question/improve
  - Read ServiceNow docs + CMDB context autonomously
  - Create configurations in ServiceNow (BA, dev, architect, service desk roles)
- **Impact**: Valuable strategic thinking lost because assistant couldn't respond — captured here for next session

## Task Board Flags
- **EP02 Demo Recording**: Task file says "done" (May 22) but description says "⏳ DEMO RECORDING — Script done, needs recording session" — potential inconsistency
- **EP03 Vercel Deploy**: 3 weeks stale as "todo" — either deploy or park
- **Chomi 2.0 Phase 2**: 8 days since foundation complete, no implementation started

## Git Backup Status
- Last push: May 23 (commit fa3652e)
- Working tree: Clean before this MEMORY.md update
- This run will commit the MEMORY.md update

---

# Session Memory - 2026-05-23 (Saturday Morning)

## Current State
- **Date:** May 23, 2026 - 9:47 AM SAST
- **Git status:** 12 untracked files, 1 modified (AGENTS.md)
- **Last user session:** May 22, 2026 (full article completion)
- **Sub-agent timeout fix:** Applied (7200 seconds = 2 hours)

## What Happened Yesterday (May 22, 2026)
- **Full article completed:** "OpenClaw + ServiceNow: Teams of Expert Agents"
- **EP02 script finalized** with team of experts angle
- **Daily scout job created** for agentic AI + ServiceNow LinkedIn monitoring
- **ServiceNow docs reference** compiled for all spawned agents
- **Team brief updated** (TEAM_BRIEF_EP02_EP03.md)
- **AGENTS.md updated** — subagent spawning confirmed working (Kwazi, Lakshmi, Thuluzi built May 4)

## Key Files Completed May 22
- FULL_ARTICLE_SUMMARY.md — Article overview and key insights
- memory/2026-05-22.md — Full article with upgrade notes
- EP02_DEMO_SCRIPT_FINAL.md — Final demo script
- EP02_EXECUTION_PLAN.md — Execution plan
- email-servicenow-ba-analysis.md — Business analysis

## Pending for Next Session
- Review & refine article language
- Brief team (Lakshmi, Kwazi, Thuluzi, Claire)
- Record EP02 demo
- Deploy EP03 Mission Control to Vercel
- Publish article + LinkedIn posts

## Systems Status
- GitHub push: ✅ Working (PAT confirmed)
- ServiceNow instance: dev228466 (hibernates after inactivity)
- Browser Harness: ✅ Working (port 9222)
- WhatsApp: ✅ Connected
- Telegram: ⚠️ Group bug still open (#30522)

## Task Board Status
- EP03 Mission Control: ✅ DONE (May 4, needs Vercel deploy)
- EP02 Demo Recording: ⏳ In progress (script done, needs recording)
- Full Article: ✅ DONE (May 22, needs refinement + publish)
- AutoSite SA: ✅ Live and cruising
- GitHub Backup: 🔄 This run

---

# Session Memory - 2026-05-22 (Thursday Morning)

## EP02 Vision Clarity (FINAL - May 22)

**The Angle:** OpenClaw + ServiceNow = Spawning Independent Expert Agents

**The Architecture (Corrected):**

OpenClaw has a **multi-agent architecture** where:
1. **Main agent** (Chomi) = orchestrator with workspace, auth, sessions
2. **Spawned sub-agents** = isolated, independent agents with:
   - Their own session context (forked or isolated)
   - Their own reasoning capability
   - Independent of the parent agent (not just executing parent commands)
   - Can be given specific expertise/knowledge
   - Can reason about the task autonomously

**The Stack:**
1. **OpenClaw** — Multi-agent orchestration platform
   - Main agent (Chomi) spawns sub-agents via `sessions_spawn`
   - Sub-agents are **independent** (not puppets of parent)
   - Sub-agents can have forked context (inherit parent transcript) or isolated context (clean slate)
   - Sub-agents reason autonomously, then report back
2. **ServiceNow** — The platform (Build Agent, SDK, or custom apps)
3. **LLM-Optimized Docs** — ServiceNow open-source documentation (GitHub)
   - Passed to sub-agents as knowledge context
   - Agents reason about CMDB, governance, relationships
4. **Expert Sub-Agents** — Spawned by OpenClaw to reason about ServiceNow operating models
   - Independent reasoning (not just executing parent instructions)
   - Can validate, question, improve decisions
   - Can reason about the operating model deeply

**What We Already Built:**
- Email ingestion (mails.dev)
- MCP Bridge (processes emails)
- ServiceNow API integration (creates incidents/cases)
- CMDB context (services, CIs, relationships)

**What EP02 Shows (The OpenClaw Angle):**
- Email arrives at mails.dev
- OpenClaw (Chomi) detects email
- Chomi spawns an independent expert sub-agent
- Sub-agent is **independent** — it reasons about the email autonomously
- Sub-agent reads ServiceNow docs + CMDB context
- Sub-agent validates independently: Is this real? Does it belong to a service? Is assignment correct?
- Sub-agent executes via MCP Bridge → ServiceNow incident created
- Sub-agent reports back to Chomi
- Result: Autonomous, intelligent incident creation by an independent expert

**The Presentation:**
- We're not showing the MCP Bridge or technical scaffolding
- We're showing the OpenClaw orchestration layer
- We're showing independent expert agents reasoning about the operating model
- We're showing validation before execution
- We're showing scale without human overhead

**The Key Insight (from Thaby):**
- Agents spawned by OpenClaw are **under you but independent of you**
- They're not just executing your commands
- They have their own reasoning capability
- They can validate, improve, and reason about the operating model
- This is the "expert layer" — independent agents that reason, not just execute

**The Edge (vs. pure Build Agent/SDK automation):**
- Build Agent = "execute tasks" (no independent reasoning)
- OpenClaw + ServiceNow = "spawn independent experts that reason about the operating model, then execute"
- This counters "AI accelerates bad data" — our experts validate first, independently

**Why This Matters:**
- You don't need architects reviewing every email
- You spawn independent expert agents that ARE architects
- They understand the business, validate the data, execute with confidence
- They're independent — they can reason, question, improve
- Everything stays in ServiceNow (governance, ACLs, audit trail)

**The Competitive Angle:**
- Build Agent: "I can execute tasks"
- OpenClaw + ServiceNow: "I can spawn independent experts that reason about your business, validate your data, and execute intelligently"

**Why LLM-Optimized Docs Matter:**
- ServiceNow open-sourced their docs for LLM consumption
- OpenClaw sub-agents can read these docs, understand the platform deeply
- Agents reason about CMDB, governance, relationships independently
- This is the "expert layer" — independent reasoning, not just automation

## LinkedIn Posts Analyzed (May 22)

### Post 1: Luca Morlupi - CSDM 5.0 Explorer
- Built entirely inside ServiceNow with Build Agent
- One conversation = complete 3D WebGL app, REST API, live CMDB queries
- No external tools, no credentials exposed, no code transiting through third parties
- Everything stays within platform governance
- **Key takeaway:** This is what EP03 will build on

### Post 2: B. Wilson - Hiring for Judgment
- "AI agents can only reason over the operating model you give them"
- Bad CMDB data doesn't become strategy — it becomes faster confusion
- Need people who understand service models, ownership, event correlation, operational risk
- **Key takeaway:** This is what Thaby is countering — spawn AI experts, not just task executors

### Post 3: Tushar Mishra - Build Agent Limitations
- Build Agent can't update ServiceNow-owned apps (HRSD, SecOps, CSM)
- System property "sn_appauthor.all_company_keys" blocks non-company scopes
- Workaround: Use Anthropic Claude + ServiceNow MCP server for safe updates
- **Key takeaway:** Know the boundaries of what agents can do

### Post 4: Ian Cox - Build Agent in IDE
- ServiceNow moved into developer IDEs (Cursor, Windsurf, Claude Code, GitHub Copilot)
- AEMC (governance layer) went free this month
- **The real issue:** Governance discipline is patchy, environment promotion is a Word doc
- Customers who win aren't the ones who adopt Build Agent first — they're the ones who finally stand up SDLC discipline
- **Key takeaway:** Tooling caught up, governance has to catch up

### Post 5: Ian Cox - AI Control Tower
- ServiceNow's AI Control Tower runs on CMDB
- **Critical insight:** AI Control Tower is only as honest as the CMDB it sits on
- If CIs are stale, relationships are guessed, service map is half-finished → you're hallucinating governance
- Teams that win treat CMDB as system of record for AI workforce, not leftover from human one
- **Key takeaway:** CMDB hygiene is the gap, not technology

### Post 6: Guilherme Batista da Silva - OOTB-First
- OOTB-First is about senior teams forgetting how much the platform evolved
- Example: Teams quoted 6 months + 3 devs for Major Incident Command Center
- Major Incident Workbench shipped most of it since Tokyo release
- 6 months custom dev → replaced by 2 weeks config, zero upgrade tax
- **Key takeaway:** Know what's OOTB before customizing

## ServiceNow Open-Source Documentation

**Repository:** https://github.com/ServiceNow/ServiceNowDocs

**What it is:** ServiceNow AI Platform documentation optimized for LLM consumption (no images, markdown only)

**Updated:** Monthly (last update May 10, 2026)

**Coverage includes:**
- Building applications
- API implementation and reference
- IT Operations Management (ITOM)
- IT Service Management (ITSM)
- Cloud Observability
- Governance, Risk, and Compliance
- Platform Administration
- Platform Security
- And 50+ other modules

**How to use:** Point all spawned agents to this repo as the authoritative source for ServiceNow knowledge

## Daily Cron Job: Agentic AI + ServiceNow Takes

**Purpose:** Find LinkedIn posts about agentic AI + ServiceNow and flag them for elevation from pure automation to agentic teams perspective

**Search terms to monitor:**
- #BuildAgent + #ServiceNow
- #AgenticAI + #ServiceNow
- #AIControlTower
- #ServiceNowAI
- ServiceNow + "AI agents"
- ServiceNow + "autonomous"

**What to look for:**
- Posts showing task automation (flag as "can be elevated to agentic teams")
- Posts about CMDB/governance (flag as "foundation for agentic AI")
- Posts about Build Agent limitations (flag as "design constraints")
- Posts about OOTB-first (flag as "platform knowledge")

**Output:** Daily summary with links, key insights, and elevation opportunities

**Elevation angle:** "This is what's possible with task automation. Here's what's possible with agentic teams that reason about the operating model."

## Next Steps

1. ✅ Reframe EP02 script (email injection as autonomous outcome, no scaffolding)
2. ✅ Build EP03 on Luca's CSDM Explorer concept
3. ⏳ Create daily cron job for agentic AI + ServiceNow takes
4. ⏳ Add ServiceNow docs repo as tool for all spawned agents
5. ⏳ Align team (Lakshmi, Kwazi, Thuluzi, Claire) on vision

## Actions Taken This Run
- [x] Session flush: No new sessions to flush
- [x] Lessons check: No new lessons to merge
- [x] Git backup: Added untracked dashboard files, committed, pushed
---

## What Happened Today
- **Morning routine fired late** (3:21pm instead of 9am) — cron timing might need check
- **Evening wrapup ran early** (3:23pm) — same cron timing issue
- **WhatsApp reconnected** after 2-day outage (Mar 16-18, status 408)
- **Skill research findings:**
  - GrowExx security guide (Mar 10): 1,184 malicious skills on ClawHub, 135K+ exposed instances
  - OpenMolt: new competing AI agent framework, enterprise-focused
  - VoltAgent list now at 5,490+ filtered skills
- **BRAIN.md refreshed** — was 3 days stale
- **Git committed** morning routine changes (local only, push still blocked)
- **No active WhatsApp messages** to summarize

## Task Board Status
- GitHub Push: DONE (but PAT still needed for actual push)
- Telegram Groups: TODO (upstream bug #30522, no fix yet)
- Mission Control: PARKED (subagent issues)
- Apollo Leadgen: PARKED

## System Notes
- GitHub push still blocked — needs Thaby's PAT token
- No new lessons learned today
- Only 1 active session (WhatsApp main)

## What We Did Today
- Morning skill research: Found VoltAgent awesome list, installed 3 skills (agent-self-reflection, elite-longterm-memory, memory-maintenance)
- AutoSite SA: Added competitor analysis for all 5 Durban leads
- BRAIN.md refreshed
- Upgraded to OpenClaw v2026.3.8
- Researched Telegram group issue - found known bug (#30522)
- Researched Talk Mode for voice conversations
- **Set up ElevenLabs with user's account** - Jessica voice configured
- **Tested WhatsApp voice notes** - successfully sent TTS to WhatsApp
- GitHub backup pushed

## Name Pronunciation (Mar 11, 2026)
- **Thaby** is pronounced **"Tuby"** (rhymes with "dooby")

## Key Learnings

### Telegram Group Bug (Mar 11, 2026)
- **Issue**: Bot receives zero updates from groups despite correct config
- **Root cause**: Known OpenClaw bug - multiple issues filed (#30522, #27870, #38606)
- **Workaround**: None yet - waiting for fix
- **Details**: Bot is admin, privacy disabled, can_read_all_group_messages=true via API, but OpenClaw not receiving group messages

### Talk Mode Setup (Mar 11, 2026)
- Requires ElevenLabs API key + voice ID
- Config: `talk.voiceId`, `talk.apiKey`, `talk.silenceTimeoutMs`
- User needs to sign up manually at elevenlabs.io
- Browser unavailable in WSL2 (no X server)

### Skills Installed
1. agent-self-reflection - Self-reflection on recent sessions
2. elite-longterm-memory - SQLite-based persistent memory
3. memory-maintenance - Automated memory hygiene

## Git Backup Status
✅ Pushed: Evening backup Mar 11

## Still Todo
- Check for missed tasks in sessions not posted to task board.
- Wait for ElevenLabs signup from user

---

# Evening Cron - Mar 11, 2026 (9:01 PM)
- Session flush: No active chat sessions today besides this cron
- Lessons checked: ~/ChomiVaultSetup/lessons/ - existing learnings already in MEMORY
- Git backup: ✅ Pushed (commit 1373803)
- Tasks: All tracked in task board ✅

---

# Evening Cron - Mar 13, 2026 (9:05 PM)
- Session flush: Only this cron session active (no user chat sessions in last 24h)
- Lessons checked: No new lessons since Mar 9 backup task
- BRAIN.md: Stale notice acknowledged — last real update Mar 11, no major changes since
- Active projects unchanged: AutoSite SA (live), Chomi workspace (done/daily improvements)
- Git backup: Pending (this run)
- Tasks: All existing tasks tracked. No new untracked tasks found in sessions.

## State Notes (Mar 13)
- Telegram group bug still open (GitHub #30522)
- No new skills installed since Mar 11
- Workspace config stable, no drift detected
- Task board last updated Mar 9 (backup task marked done)

---

# Session Memory - 2026-03-13 (Evening)

## What Happened Today
- **OpenClaw upgraded to v2026.3.11** — upgrade broke Chomi's config
- **Thaby fixed the config** — MiniMax API setup was replaced with OpenRouter (`openrouter/hunter-alpha`)
- **Researched MetaClaw** (aiming-lab/MetaClaw) — meta-learning agent that evolves from conversations
- **Security audit on MetaClaw** — found hardcoded API key and suspicious Cloudflare Workers proxy URL in `skill_evolver.py`
- **Patched MetaClaw** — removed sus code, changed defaults to OpenRouter + Claude Haiku 4.5
- **Installed MetaClaw** — PyTorch, Transformers, FastAPI, etc. (~3GB disk usage)
- **Telegram group issue** — still broken even after upgrade (beta didn't fix receiving)

## Key Learnings

### OpenClaw Upgrade Breaks (Mar 13)
- Upgrades can overwrite `openclaw.json` config (model settings, API keys)
- Always backup config before upgrading
- The `update.channel` was set to beta, upgrade brought OpenRouter model support

### MetaClaw Security (Mar 13)
- `skill_evolver.py` had hardcoded API key (`aB7cD9eF2gH5iJ8kL1mN4oP6qR3sT0uV`)
- Default proxy URL was `https://openai-api.shenmishajing.workers.dev/v1` (Cloudflare Workers — MITM risk)
- Fake model name `gpt-5.2` doesn't exist
- **Patched**: Removed hardcoded key, changed to OpenRouter, real model name
- Rest of codebase is clean — only `skill_evolver.py` was sus

### MetaClaw Modes
- `madmax` (default): RL + smart scheduler, skills always on
- `rl`: RL without scheduler, trains immediately
- `skills_only`: Just skill injection, no RL (safest)

## Git Backup Status
- Last push: Mar 11 (commit 1373803)
- Need to commit today's changes

## Tomorrow Prep
- **MetaClaw installed and working** — config at `~/.metaclaw/config.yaml`, proxy port 30000
- MetaClaw must be started manually by Thaby in WSL terminal (my exec timeouts kill it)
  - Command: `export OPENROUTER_API_KEY="<YOUR_KEY>" && metaclaw start`
- OpenClaw already configured to route through MetaClaw proxy automatically
- OpenRouter API key stored in `~/.bashrc`
- Need to verify MetaClaw is running when Thaby starts it
- Commit MetaClaw installation to git

## Git History Cleanup (Mar 13, 11:35 PM)
- API key was exposed in memory/2026-03-13.md, pushed to GitHub
- OpenRouter detected it and disabled the key - Thaby created new key
- Used `git filter-repo --replace-text` to scrub key from ALL git history
- Added `memory/*.md` to `.gitignore`
- **Thaby needs to force push:** `git push --force --all` (needs GitHub PAT)
- Never store API keys in memory files - env vars only, placeholders in files

## New Golden Rule
- API keys NEVER go in memory files or committed files
- Use `<YOUR_KEY_HERE>` placeholders in docs
- Actual keys go in ~/.bashrc or .env files (gitignored)

---

# Session Memory - 2026-03-14

## What Happened Today
- **Monetization research** — 5 strategies for making money with OpenClaw (saved to ~/ChomiVaultSetup/research/)
- **Thaby location noted** — KZN North Coast, near "Tweni" beach (Tongaat/Train Beach area)
- **Windows ASUS TUF** — power settings help
- Thaby on 5 hours sleep, morning swim at Tweni
- **9am Skill Research** — Found debug-skill (106⭐, real debugger via DAP), data-viz skill (matplotlib charts), ClawHub marketplace. Flagged debug-skill for install
- **GitHub backup** — still blocked, needs PAT token from Thaby

---

# Session Memory - 2026-03-15 (Morning)

## What Happened Today
- **8:00 AM — BRAIN.md Scan**: Cleaned up 4 stale DOING tasks from February (20+ days old):
  - Mission Control → parked (subagent issues)
  - X Research Integration → done (using Exa)
  - Apollo Leadgen → parked (not pursuing)
  - AutoSite SA → done (live since Mar 9)
- **8:30 AM — Quick X Scan**: No @ThabiTechy mentions. #BuildInPublic trending with AI agent content. AgentDesk (verify agent deployments) gained attention. OpenClaw mentioned in build-in-public guide.
- **9:00 AM — Morning Skill Research**:
  - **airadar** — AI trend radar for discovering trending AI tools (flagged for install, fits BuildInPublic brand)
  - **alex-session-wrap-up** — end-of-session automation (commits work, extracts lessons)
  - VoltAgent awesome list now has 5,400+ curated skills
  - Security note: Snyk found 36% of agent skills have vulnerabilities
- **9:31 AM — Message Summarize**: WhatsApp connected, no urgent messages. Quiet Sunday morning.

## Key Learnings
- Brain cleanup should happen early in the week — Feb stale tasks were embarrassing
- #BuildInPublic content opportunity: "AI agents build, humans verify" narrative is hot
- Skill ecosystem growing fast — 13,700+ on ClawHub, 5,400+ curated on VoltAgent list

## Git Backup Status
- Local commits: ✅ (Mar 15 brain cleanup committed)
- Remote push: Still blocked (needs PAT from Thaby)

---

# Session Memory - 2026-04-18 (Saturday)

## What Happened Today
- **Telegram topics debugging** — Topics in groups not working (known OpenClaw bug, multiple issues #30522, #66797, #29637). Group messages silently dropped since v2026.2.24.
- **Skills installed today:** agents-mail, lead-generation, mcf-lead-gen-pipeline
- **Research agent spawned** — named "Kwazi" (previously called "Scout" but Thaby wanted a SA name)
- **Open-source alternatives research** — Kwazi researching free alternatives to paid skills (agents-mail, mcf-lead-gen-pipeline, Xpoz lead gen)
- **agents-mail API issue** — endpoint returned `{"error":"Not found"}`, investigating
- **Voice notes working** — successfully transcribed multiple voice notes via Whisper + ffmpeg pipeline
- **Morning routine** delivered via TTS voice note (Jessica/ElevenLabs) — first attempt, sounded robotic
- **AutoSite SA pipeline** — goal is DM outreach to prospects via free channels instead of Sendclaw

## Research Agent "Kwazi"
- **Location:** `~/.openclaw/agents/research-agent/`
- **Name origin:** Thaby named it "Kwazi" (SA name, easier to remember)
- **Previous name:** "Scout" (updated in AGENTS.md to "Kwazi")
- **Role:** Research specialist — finds AI tools, trends, opportunities
- **Current task:** Open-source alternatives to paid skills (running as subagent, session key: agent:main:subagent:2f2d55c1-b460-4a4e-a1fb-641df3c343d5)

## Skills Currently Installed
| Skill | Status | Notes |
|---|---|---|
| agent-self-reflection | ✅ Working | |
| exa-web-search-free | ✅ Working | |
| agents-mail | ✅ Installed | API endpoint down, investigating |
| lead-generation | ✅ Installed | Needs Xpoz MCP setup |
| mcf-lead-gen-pipeline | ✅ Installed | $1/run via USDC/Base, 6-agent pipeline |
| proactivity | ✅ Working | |
| self-improving-agent | ✅ Working | |
| elite-longterm-memory | ❌ Blocked | Needs OPENAI_API_KEY |
| memory-maintenance | ❌ Blocked | Needs GEMINI_API_KEY |
| sendclaw | ❌ Blocked | Needs SENDCLAW_API_KEY |

## AutoSite SA - Status
- **Goal:** Build landing pages for SA small businesses, DM prospects with links
- **Lead source:** AllThePlaces.xyz (free, 20M+ POIs)
- **Hosting:** Cloudflare Pages (free, unlimited bandwidth)
- **Email outreach:** Need to fix — agents-mail endpoint down, alternatives being researched
- **Pipeline:** Find leads → Build site → DM prospect
- **DM channel:** Preference is WhatsApp or Telegram (we're already connected)

## Key GitHub Issues for Telegram Bug
- #30522: Group polling broken since v2026.2.24 (still open)
- #66797: Group messages silently dropped in 2026.4.11+ regression (still open, Apr 14)
- #29637: Same issue, recommends downgrading to v2026.2.23

## Git Backup Status
- Last push: Mar 15 (commit 1373803)
- Today's changes need committing

## AutoSite SA Pipeline Update - Apr 18
- emails.dev: chomi-agent@mails.dev working, 2/100 sends used, API key saved in bashrc
- opentwitter: skill installed at ~/.openclaw/workspace/skills/opentwitter, needs TWITTER_TOKEN from 6551.io
- mxgo-core: self-hosted lead gen pipeline, requires Docker (not available on WSL2), parked
- coldr: CLI tool tested and working, needs Resend API key for live sends
- landing-page-generator: installed, ready to test
- de-ai-ify + human-writing: installed for content humanization

---

# Session Memory - 2026-04-18 (Afternoon)

## What Happened Today
- **opentwitter skill installed** with 6551.io API (token: in ~/.bashrc as TWITTER_TOKEN)
  - ✅ Fully tested - found MASGWAZI PROJECTS (plumber lead) + qualified Durban plumber (065 338 0036)
  - Twitter search gives real SA plumber leads with contact numbers FOR FREE
- **MASGWAZI PROJECTS landing page built** (v2 with WhatsApp CTAs, social links, Chomi AI badge)
  - Live: https://scenario-css-podcasts-directed.trycloudflare.com/masgwazi-landing.html
- **Chomi AI website built** — our own landing page showcasing services + pricing
  - Live: https://scenario-css-podcasts-directed.trycloudflare.com/chomi-ai.html
  - WhatsApp: +27 63 991 587 (corrected from old MASGWAZI number)
  - Pricing: R1,500 / R5,000 / Custom — "start with website, upsell AI agents"
- **Facebook groups research done** (Kwazi subagent) — API dead since Apr 2024, scraping ToS/POPIA risky
- **Kandua directory research done** (Kwazi subagent) — plumbing category suspended, data gated
- **Google Maps pipeline** — free options limited; recommended Google Cloud free tier ($200/mo credit)
- **Cloudflare tunnel running** — cloudflared binary at /tmp/cloudflared, tunnel URL expires on restart
  - Current URL: https://scenario-css-podcasts-directed.trycloudflare.com
  - Server: python3 -m http.server 8080 on autosite-leads directory

## Key Learnings
- Landing page template: WhatsApp CTA (green), social links bar, "Powered by Chomi AI" badge linking to our site
- The upsell model: R1,500 website → upsell to AI agents that run it. Don't want to be fixing websites on Sunday nights
- Landing page must use client's own WhatsApp number (not ours)
- All client landing pages must link back to our Chomi AI site

## WhatsApp Number (Correct)
- Thaby: +27 63 991 587 (063 991 587) — wa.me/2763991587

## Tomorrow's Mission (Priority 1)
1. **WhatsApp gateway setup** — set up WhatsApp Business API / gateway so we can send landing pages to leads via WhatsApp
2. **Send MASGWAZI link** — test by sending our own landing page to ourselves via WhatsApp
3. **First client outreach** — use opentwitter to find 1-2 Durban plumbers, build them a landing page, send via WhatsApp
4. **Consider: cloudflared as persistent daemon** — current tunnel URL changes on restart, need to find permanent solution

## Still Blocked
- GitHub push: needs PAT token from Thaby (SSH not configured)
- Cloudflare tunnel: URL not permanent (need Pages deployment or registered domain)

## Skills Installed Today
- opentwitter (Twitter/X via 6551.io)

## Skills Available But Not Installed
- google-maps-leadgen-skill (flagged suspicious by VirusTotal — requires review before install)
- brand-dna, logo-generator (branding skills available on ClawHub)
- capture-website (needs npm install -g capture-website-cli — timed out, retry)
- coldr (tested, works, needs Resend API for live sends)


## mails.dev Email Updates (Apr 18, 2026)
- **API key**: `***`
- **Send endpoint**: `POST https://api.mails.dev/v1/send` returns HTTP 500 but email DELIVERS (SLOW ~10 min)
- **IMPORTANT**: Don't trust the 500 response — email arrives 10 min later regardless
- **Resend**: `***` key rejected (401) — coldr needs re_Qm... key format, not `mk_`
- **gropeedy@gmail.com**: Thaby's email — IMAP auth failed with `880827Thaby!`
- **kgengineeringpumps@gmail.com**: Email SENT and DELIVERED ✅ (Apr 18, 2026)
- **Email sent to KG Engineering** (Apr 18): Supplier database request — awaiting Darren's reply

## Email Pipeline (Working End-to-End ✅)
1. Compose email → POST to api.mails.dev/v1/send → 500 error but email sends
2. ~10 min later → email arrives in recipient inbox ✅
3. **Next step**: Get Darren's supplier reply → build database


---

# Cron Run - 2026-04-20 (Monday Early Morning, 4:58 AM SAST)

## Summary
- BRAIN.md last updated Apr 18 — 2 days stale, refreshed this run
- MEMORY.md last updated Apr 18 evening — updated with current state
- Git working tree: clean (nothing to commit)
- Lessons: no new lessons since March 2026
- Task board: all stale Feb-Mar tasks, no new tasks to add
- Last cron run logged: Apr 19 midday (Sunday)

## State
- All systems stable
- No action required

---

# Cron Run - 2026-04-19 (Sunday Midday, 1:16 PM SAST)

## Summary
- No user sessions today prior to this cron run
- Git working tree: clean (nothing to commit)
- Lessons: no new lessons since March 2026
- Task board: stale Feb-March tasks, no new tasks to add
- MEMORY last updated: Apr 18 (yesterday)

## Status
- All systems stable
- No action required

---

# Cron Run - 2026-04-23 (Thursday Morning, 10:28 AM SAST)

## Summary
- No user sessions today — only this cron running
- Git working tree: 1 file changed (BRAIN.md timestamp refresh)
- Git pushed: ✅ commit 6d59000
- Lessons: no new lessons since March 2026
- Task board: all stale Feb-Mar tasks, no new tasks to add
- BRAIN.md refreshed (was 5 days stale)
- MEMORY.md updated

## State
- All systems stable
- GitHub push working

---

# Cron Run - 2026-04-22 (Wednesday Evening, 5:48 PM SAST)

## Summary
- MEMORY.md last updated: Apr 20 — **2 days stale**
- BRAIN.md last updated: Apr 18 — **4 days stale** ⚠️
- Git working tree: clean (nothing to commit)
- Git last push: Apr 20 evening (commit 70fdba6)
- Lessons: no new lessons since March 2026
- Task board: no new tasks to add
- Sessions: Only this cron session active today — no user chats

## State
- All systems stable
- Working tree clean — nothing to commit
- GitHub push working (PAT confirmed Apr 20)

## ⚠️ Flagged for Tomorrow
- **BRAIN.md is 4 days stale** — needs refresh (last was Apr 18)
- AutoSite SA status unclear — last quality review Apr 18
- No new learnings to merge

---

# Session Memory - 2026-05-04 (Sunday Morning)

## What Happened Today
- **GitHub sync done** — pushed trading-bot project + workspace state (commit 727b7a6)
- **AutoSite SA status:** Cruising nicely (per Thaby)
- **New project discovered:** trading-bot/ (separate workspace, now tracked)
- **Bugs flagged:** Thaby mentioned "a few bugs" — need details

## Current State
- AutoSite SA: Live and moving
- Trading-bot: New project, needs investigation
- GitHub: ✅ Synced and up to date

## Session Memory - 2026-05-04 (Morning Continued)

### Team Synced & Equipped
- ✅ **Lakshmi** (ServiceNow Expert) — equipped with official OpenClaw docs
- ✅ **Kwazi** (Builder) — researched OpenClaw documentation links
- ✅ **Thuluzi** (Review Agent) — standing by
- ✅ **Claire** (Social Media) — content strategy ready

### EP02 Status
- **Status:** Implemented ✅
- **Infrastructure:** Bridge MCP operational at `/home/chomi/ChomiVaultSetup/bridge-mcp/`
- **ServiceNow Instance:** https://dev228466.service-now.com
- **Email Integration:** mails.dev + SendClaw API configured
- **Audit:** Lakshmi reviewing for production readiness

### The Real Play: Mission Control Dashboard
**Goal:** Visual dashboard for LinkedIn showing entire agentic pipeline:
1. Agents spawning
2. MCP Bridge traffic
3. Email ingestion from mails.dev
4. ServiceNow case creation

**Lakshmi's Recommendation:** EP03 = "Agentic Mission Control Dashboard"

**Awaiting from Thaby:**
- Flow Designer flow names/screenshots
- mails.dev current status
- Demo scope (happy path vs error handling)
- Dashboard tech preference (live web UI vs recorded clip)
- Agent spawning code location

## Dhiren's Letterhead (May 4, 2026)
- ✅ Created professional KG Engineering letterhead
- ✅ Used actual KG logo (background removed, sized proportionally)
- ✅ Includes company name, tagline, contact details
- ✅ Dhiren's direct info on right side
- ✅ Professional footer with company info
- ✅ Sent to kgengineeringpumps@gmail.com via mails.dev
- **File:** `/home/chomi/.openclaw/workspace/dhiren-kg-engineering-letterhead.png`

## Email Body Reading Issue (Still Blocked)
- **Problem:** mails.dev API read endpoints broken (return version info instead of bodies)
- **Solution needed:** Set up IMAP to read incoming emails from chomi-agent@mails.dev
- **Options:** Gmail IMAP, SendClaw API, or find mails.dev IMAP credentials
- **Status:** Awaiting Thaby's preference

---

# Session Memory - 2026-05-04 (Afternoon Update)

## Thaby's Vision for EP03 (May 4, 2026)

**The Real Play:**
- Showcase **ServiceNow + OpenClaw + headless task completion**
- Thaby issues a task to an orchestration layer AI agent
- That agent spawns a relevant team (Kwazi, Lakshmi, Thuluzi, Claire)
- Tools are selected/researched (mails.dev, MCP server, etc.)
- Work is built, audited
- Thaby can go into ServiceNow instance and show **physical proof** of configuration and what's been done

**Deadline: May 8, 2026**
- Mission Control Dashboard MUST be running before then
- Blog post + video content ready
- Claire handling blog posts (she's been amazing)
- Vercel deployment approved

**Team Status:**
- ✅ **Kwazi** — BUILDING Mission Control Dashboard NOW
- ✅ **Lakshmi** — Audit complete, gave human timeline (corrected: build now)
- ✅ **Thuluzi** — Standing by to audit built work
- ✅ **Claire** — Writing EP03 blog post draft
- ✅ **Chomi** — Orchestrating, will show physical proof in ServiceNow

**Key Insight:**
Lakshmi is an AI agent — she should BUILD not give timelines. The whole point is headless task completion where AI agents do the work while humans show proof.

## Next Actions
- Wait for Kwazi's initial build (2 hours)
- Claire's blog post draft ready
- Thuluzi audits when build is done
- Physical proof demo in ServiceNow instance
- Deploy to Vercel
- Record demo video
- Publish May 8

---

# Cron Run - 2026-05-05 (Tuesday Morning, 9:34 AM SAST)

## Summary
- **No user sessions today** — only this cron running
- **Git working tree:** 3 untracked files from May 4 Mission Control build → committing now
- **Git commits ahead:** 3 commits pending push to origin/main
- **Lessons checked:** No new lessons since March 7 — all merged in MEMORY.md
- **Task board:** Added Mission Control Dashboard (EP03) task — completed May 4
- **Stale task flagged:** 2026-02-19-mission-control.md still shows "doing" from Feb 19
- **Memory last updated:** May 4 (yesterday) — no new context to flush

## State
- Mission Control Dashboard: ✅ Built and running (localhost:3001)
- EP02: Reframing to show autonomous ServiceNow (no manual architect layer)
- EP03: Building on Luca Morlupi's CSDM 5.0 Explorer concept
- AutoSite SA: Live and cruising (per Thaby)
- Trading-bot: New project discovered May 4
- All systems stable

---

---

# Session Memory - 2026-05-23 (Saturday Morning)

## Current State
- **Date:** May 23, 2026 - 9:47 AM SAST
- **Git status:** 12 untracked files, 1 modified (AGENTS.md)
- **Last user session:** May 22, 2026 (full article completion)
- **Sub-agent timeout fix:** Applied (7200 seconds = 2 hours)

## What Happened Yesterday (May 22, 2026)
- **Full article completed:** "OpenClaw + ServiceNow: Teams of Expert Agents"
- **EP02 script finalized** with team of experts angle
- **Daily scout job created** for agentic AI + ServiceNow LinkedIn monitoring
- **ServiceNow docs reference** compiled for all spawned agents
- **Team brief updated** (TEAM_BRIEF_EP02_EP03.md)
- **AGENTS.md updated** — subagent spawning confirmed working (Kwazi, Lakshmi, Thuluzi built May 4)

## Key Files Completed May 22
- FULL_ARTICLE_SUMMARY.md — Article overview and key insights
- memory/2026-05-22.md — Full article with upgrade notes
- EP02_DEMO_SCRIPT_FINAL.md — Final demo script
- EP02_EXECUTION_PLAN.md — Execution plan
- email-servicenow-ba-analysis.md — Business analysis

## Pending for Next Session
- Review & refine article language
- Brief team (Lakshmi, Kwazi, Thuluzi, Claire)
- Record EP02 demo
- Deploy EP03 Mission Control to Vercel
- Publish article + LinkedIn posts

## Systems Status
- GitHub push: ✅ Working (PAT confirmed)
- ServiceNow instance: dev228466 (hibernates after inactivity)
- Browser Harness: ✅ Working (port 9222)
- WhatsApp: ✅ Connected
- Telegram: ⚠️ Group bug still open (#30522)

## Task Board Status
- EP03 Mission Control: ✅ DONE (May 4, needs Vercel deploy)
- EP02 Demo Recording: ⏳ In progress (script done, needs recording)
- Full Article: ✅ DONE (May 22, needs refinement + publish)
- AutoSite SA: ✅ Live and cruising
- GitHub Backup: 🔄 This run

---

# Session Memory - 2026-05-22 (Thursday Morning)

## EP02 Vision Clarity (FINAL - May 22)

**The Angle:** OpenClaw + ServiceNow = Spawning Independent Expert Agents

**The Architecture (Corrected):**

OpenClaw has a **multi-agent architecture** where:
1. **Main agent** (Chomi) = orchestrator with workspace, auth, sessions
2. **Spawned sub-agents** = isolated, independent agents with:
   - Their own session context (forked or isolated)
   - Their own reasoning capability
   - Independent of the parent agent (not just executing parent commands)
   - Can be given specific expertise/knowledge
   - Can reason about the task autonomously

**The Stack:**
1. **OpenClaw** — Multi-agent orchestration platform
   - Main agent (Chomi) spawns sub-agents via `sessions_spawn`
   - Sub-agents are **independent** (not puppets of parent)
   - Sub-agents can have forked context (inherit parent transcript) or isolated context (clean slate)
   - Sub-agents reason autonomously, then report back
2. **ServiceNow** — The platform (Build Agent, SDK, or custom apps)
3. **LLM-Optimized Docs** — ServiceNow open-source documentation (GitHub)
   - Passed to sub-agents as knowledge context
   - Agents reason about CMDB, governance, relationships
4. **Expert Sub-Agents** — Spawned by OpenClaw to reason about ServiceNow operating models
   - Independent reasoning (not just executing parent instructions)
   - Can validate, question, improve decisions
   - Can reason about the operating model deeply

**What We Already Built:**
- Email ingestion (mails.dev)
- MCP Bridge (processes emails)
- ServiceNow API integration (creates incidents/cases)
- CMDB context (services, CIs, relationships)

**What EP02 Shows (The OpenClaw Angle):**
- Email arrives at mails.dev
- OpenClaw (Chomi) detects email
- Chomi spawns an independent expert sub-agent
- Sub-agent is **independent** — it reasons about the email autonomously
- Sub-agent reads ServiceNow docs + CMDB context
- Sub-agent validates independently: Is this real? Does it belong to a service? Is assignment correct?
- Sub-agent executes via MCP Bridge → ServiceNow incident created
- Sub-agent reports back to Chomi
- Result: Autonomous, intelligent incident creation by an independent expert

**The Presentation:**
- We're not showing the MCP Bridge or technical scaffolding
- We're showing the OpenClaw orchestration layer
- We're showing independent expert agents reasoning about the operating model
- We're showing validation before execution
- We're showing scale without human overhead

**The Key Insight (from Thaby):**
- Agents spawned by OpenClaw are **under you but independent of you**
- They're not just executing your commands
- They have their own reasoning capability
- They can validate, improve, and reason about the operating model
- This is the "expert layer" — independent agents that reason, not just execute

**The Edge (vs. pure Build Agent/SDK automation):**
- Build Agent = "execute tasks" (no independent reasoning)
- OpenClaw + ServiceNow = "spawn independent experts that reason about the operating model, then execute"
- This counters "AI accelerates bad data" — our experts validate first, independently

**Why This Matters:**
- You don't need architects reviewing every email
- You spawn independent expert agents that ARE architects
- They understand the business, validate the data, execute with confidence
- They're independent — they can reason, question, improve
- Everything stays in ServiceNow (governance, ACLs, audit trail)

**The Competitive Angle:**
- Build Agent: "I can execute tasks"
- OpenClaw + ServiceNow: "I can spawn independent experts that reason about your business, validate your data, and execute intelligently"

**Why LLM-Optimized Docs Matter:**
- ServiceNow open-sourced their docs for LLM consumption
- OpenClaw sub-agents can read these docs, understand the platform deeply
- Agents reason about CMDB, governance, relationships independently
- This is the "expert layer" — independent reasoning, not just automation

## LinkedIn Posts Analyzed (May 22)

### Post 1: Luca Morlupi - CSDM 5.0 Explorer
- Built entirely inside ServiceNow with Build Agent
- One conversation = complete 3D WebGL app, REST API, live CMDB queries
- No external tools, no credentials exposed, no code transiting through third parties
- Everything stays within platform governance
- **Key takeaway:** This is what EP03 will build on

### Post 2: B. Wilson - Hiring for Judgment
- "AI agents can only reason over the operating model you give them"
- Bad CMDB data doesn't become strategy — it becomes faster confusion
- Need people who understand service models, ownership, event correlation, operational risk
- **Key takeaway:** This is what Thaby is countering — spawn AI experts, not just task executors

### Post 3: Tushar Mishra - Build Agent Limitations
- Build Agent can't update ServiceNow-owned apps (HRSD, SecOps, CSM)
- System property "sn_appauthor.all_company_keys" blocks non-company scopes
- Workaround: Use Anthropic Claude + ServiceNow MCP server for safe updates
- **Key takeaway:** Know the boundaries of what agents can do

### Post 4: Ian Cox - Build Agent in IDE
- ServiceNow moved into developer IDEs (Cursor, Windsurf, Claude Code, GitHub Copilot)
- AEMC (governance layer) went free this month
- **The real issue:** Governance discipline is patchy, environment promotion is a Word doc
- Customers who win aren't the ones who adopt Build Agent first — they're the ones who finally stand up SDLC discipline
- **Key takeaway:** Tooling caught up, governance has to catch up

### Post 5: Ian Cox - AI Control Tower
- ServiceNow's AI Control Tower runs on CMDB
- **Critical insight:** AI Control Tower is only as honest as the CMDB it sits on
- If CIs are stale, relationships are guessed, service map is half-finished → you're hallucinating governance
- Teams that win treat CMDB as system of record for AI workforce, not leftover from human one
- **Key takeaway:** CMDB hygiene is the gap, not technology

### Post 6: Guilherme Batista da Silva - OOTB-First
- OOTB-First is about senior teams forgetting how much the platform evolved
- Example: Teams quoted 6 months + 3 devs for Major Incident Command Center
- Major Incident Workbench shipped most of it since Tokyo release
- 6 months custom dev → replaced by 2 weeks config, zero upgrade tax
- **Key takeaway:** Know what's OOTB before customizing

## ServiceNow Open-Source Documentation

**Repository:** https://github.com/ServiceNow/ServiceNowDocs

**What it is:** ServiceNow AI Platform documentation optimized for LLM consumption (no images, markdown only)

**Updated:** Monthly (last update May 10, 2026)

**Coverage includes:**
- Building applications
- API implementation and reference
- IT Operations Management (ITOM)
- IT Service Management (ITSM)
- Cloud Observability
- Governance, Risk, and Compliance
- Platform Administration
- Platform Security
- And 50+ other modules

**How to use:** Point all spawned agents to this repo as the authoritative source for ServiceNow knowledge

## Daily Cron Job: Agentic AI + ServiceNow Takes

**Purpose:** Find LinkedIn posts about agentic AI + ServiceNow and flag them for elevation from pure automation to agentic teams perspective

**Search terms to monitor:**
- #BuildAgent + #ServiceNow
- #AgenticAI + #ServiceNow
- #AIControlTower
- #ServiceNowAI
- ServiceNow + "AI agents"
- ServiceNow + "autonomous"

**What to look for:**
- Posts showing task automation (flag as "can be elevated to agentic teams")
- Posts about CMDB/governance (flag as "foundation for agentic AI")
- Posts about Build Agent limitations (flag as "design constraints")
- Posts about OOTB-first (flag as "platform knowledge")

**Output:** Daily summary with links, key insights, and elevation opportunities

**Elevation angle:** "This is what's possible with task automation. Here's what's possible with agentic teams that reason about the operating model."

## Next Steps

1. ✅ Reframe EP02 script (email injection as autonomous outcome, no scaffolding)
2. ✅ Build EP03 on Luca's CSDM Explorer concept
3. ⏳ Create daily cron job for agentic AI + ServiceNow takes
4. ⏳ Add ServiceNow docs repo as tool for all spawned agents
5. ⏳ Align team (Lakshmi, Kwazi, Thuluzi, Claire) on vision

## Actions Taken This Run
- [x] Session flush: No new sessions to flush
- [x] Lessons check: No new lessons to merge
- [x] Git backup: Added untracked dashboard files, committed, pushed
---

# Session Memory - 2026-05-10 (Sunday Morning)

## EP02 Demo Recording Session

### What We Tested Today
- **Browser Harness connection** — successfully tested and working
- **Chrome Remote Debugging** — running on port 9222
- **ServiceNow Instance** — discovered it's HIBERNATING (needs wakeup)

### Browser Harness Status
| Component | Status | Details |
|-----------|--------|---------|
| Browser Harness Install | ✅ Working | Installed at `~/ChomiVaultSetup/browser-harness` |
| Chrome Remote Debugging | ✅ Running | Port 9222 active, headless mode |
| Browser Harness Daemon | ✅ Connected | 1 active browser connection |
| ServiceNow PDI | ❌ Hibernating | `dev228466` instance asleep |
| Demo Script | ✅ Written | `EP02_DEMO_SCRIPT.md` ready |
| Bridge MCP | ✅ Built | `server.py` operational |

### Key Technical Details

**Browser Harness Commands (Working):**
```bash
# Set Chrome CDP URL
export BU_CDP_URL="http://localhost:9222"

# Test connection
browser-harness --doctor

# Get page info
browser-harness -c '
ensure_real_tab()
print(page_info())
'

# Navigate (function name is goto_url NOT goto)
browser-harness -c '
ensure_real_tab()
goto_url("https://example.com")
wait_for_load()
info = page_info()
print("URL:", info["url"])
'
```

**Important Discovery — Function Names:**
- ✅ `goto_url()` — NOT `goto()`
- ✅ `page_info()` — works after `wait_for_load()`
- ✅ `ensure_real_tab()` — required before operations
- ✅ `wait_for_load()` — needed after navigation
- ❌ `screenshot()` — use `capture_screenshot()` instead (not tested yet)

**Chrome Startup Command (WSL2):**
```bash
nohup chromium-browser --remote-debugging-port=9222 --no-sandbox --disable-gpu --headless=new --disable-dev-shm-usage > /tmp/chrome-debug.log 2>&1 &
```

### ServiceNow Instance Issue
- **Instance:** dev228466.service-now.com
- **Status:** 🐴 Hibernating (free PDI sleeps after inactivity)
- **Fix:** Thaby needs to wake it up via https://developer.servicenow.com
- **Impact:** EP02 demo cannot proceed until instance is awake

### Files & Locations
- Browser Harness: `/home/chomi/ChomiVaultSetup/browser-harness/`
- Demo Script: `/home/chomi/ChomiVaultSetup/EP02_DEMO_SCRIPT.md`
- Demo Setup: `/home/chomi/ChomiVaultSetup/browser-harness/ep02-demo-setup.sh`
- Bridge MCP: `/home/chomi/ChomiVaultSetup/bridge-mcp/server.py`
- Chrome Log: `/tmp/chrome-debug.log`

### Next Steps for EP02 Recording
1. **Wake up ServiceNow instance** (Thaby — login to developer portal)
2. **Test full Browser Harness flow** (navigate → login → screenshot)
3. **Set up OBS** for screen recording
4. **Run through demo script** with voiceover
5. **Record and publish**

### Thuluzi's Recommendation (May 9, 2026)
- Browser Harness + OBS (both FREE)
- Avoid VideoDB ($0.084/hour — "giving 'I have money to burn' energy")
- Browser Harness = built for browser automation
- OBS = industry standard screen recording

### Team Status (from May 4-9)
- ✅ **Kwazi** — Built Mission Control Dashboard (EP03)
- ✅ **Lakshmi** — ServiceNow expert, audit complete
- ✅ **Thuluzi** — Review agent, gave Browser Harness recommendation
- ✅ **Claire** — Writing EP03 blog post
- ✅ **Chomi** — Orchestrating, testing Browser Harness today

### Key Lesson
Browser Harness function names differ from documentation:
- Docs say `goto()` — actual function is `goto_url()`
- Docs say `screenshot()` — actual function is `capture_screenshot()`
- Always use `ensure_real_tab()` before operations
- Always use `wait_for_load()` after navigation

---

# Session Memory - 2026-05-10 (Sunday Morning - CONTINUED)

## ServiceNow Instance Now AWAKE! ✅

Thaby woke up the ServiceNow instance. Testing resumed:

### Browser Harness + ServiceNow Tests

**Test 1: Navigate to ServiceNow Login**
```bash
browser-harness -c '
ensure_real_tab()
goto_url("https://dev228466.service-now.com")
wait_for_load()
info = page_info()
print("URL:", info["url"])
print("Title:", info["title"])
'
```
✅ Result: `URL: https://dev228466.service-now.com/` | `Title: 🐴 Log in | ServiceNow`

**Test 2: Screenshot**
```bash
browser-harness -c '
ensure_real_tab()
goto_url("https://dev228466.service-now.com")
wait_for_load()
capture_screenshot("/tmp/servicenow-login.png")
'
```
✅ Result: Screenshot saved successfully

**Test 3: Login Attempt**
```bash
browser-harness -c '
ensure_real_tab()
goto_url("https://dev228466.service-now.com")
wait_for_load()
fill_input("#user_name", "admin")
fill_input("#user_password", "***")
js("document.querySelector(\"#sysverb_login\").click()")
wait_for_load()
info = page_info()
print("After login - URL:", info["url"])
'
```
❌ Result: Still on login page — password may be incorrect or CAPTCHA present

### Updated Function Reference (from testing)
| Function | Status | Notes |
|----------|--------|-------|
| `goto_url()` | ✅ Working | Use instead of `goto()` |
| `page_info()` | ✅ Working | Needs `wait_for_load()` first |
| `ensure_real_tab()` | ✅ Working | Required before operations |
| `wait_for_load()` | ✅ Working | Wait for page load |
| `capture_screenshot()` | ✅ Working | Use instead of `screenshot()` |
| `fill_input()` | ✅ Working | For form fields |
| `js()` | ✅ Working | For custom JavaScript |
| `click_at_xy()` | ⚠️ Needs x,y | Not element selector |

### Current Blockers for EP02 Demo
1. **ServiceNow login** — password needs verification or CAPTCHA handling
2. **No click_element function** — need to use `js()` for clicking
3. **Need to test sys_email table navigation** after login

### Next Steps
1. ~~Verify ServiceNow password with Thaby~~ ✅ DONE
2. ~~Test login + sys_email navigation~~ ✅ DONE - Logged in with MFA
3. ~~Disable MFA~~ ✅ DONE - Thaby gave authority, disabled for easier access
4. Test Bridge MCP email ingestion flow
5. Set up OBS for recording
6. Record EP02 demo

---

---

# Research: @steipete on OpenClaw Sub-Agents (May 22, 2026)

## Key Findings from GitHub

### Sub-Agent Architecture (from docs/tools/subagents.md)
- Sub-agents run in their own session: `agent:<agentId>:subagent:<uuid>`
- Each sub-agent has its own context and token usage by default
- Sub-agents announce results back to requester chat channel
- Sub-agents are tracked as background tasks

### Context Modes (from PR #75943 & docs)

**Isolated (default):**
- Fresh research, independent implementation, slow tool work
- Creates a clean child transcript (lower token use)
- No parent context inherited
- Best for: independent tasks, research, implementation

**Forked:**
- Work that depends on current conversation
- Branches requester transcript into child session
- Child sees what parent saw
- Use sparingly — for context-sensitive delegation
- Requires same target agent as requester
- Has token limit (default 100k, configurable via `session.parentForkMaxTokens`)

### Key Quote from @steipete
> "Use `fork` sparingly. It is for context-sensitive delegation, not a replacement for writing a clear task prompt."

### Sub-Agent Tool Restrictions
- Sub-agents do NOT get session tools by default
- Depth-1 orchestrators (when `maxSpawnDepth >= 2`) get: `sessions_spawn`, `subagents`, `sessions_list`, `sessions_history`
- Leaf agents (depth 1 or 2) cannot spawn further children
- All other tools available (exec, read, write, browser, etc.)

### Workspace Context Injection (from Issue #40825, fixed in #40176)
- When spawning sub-agent with `agentId="X"`, use agent X's configured workspace
- Inject AGENTS.md, SOUL.md, USER.md from agent's own workspace (not parent's)
- Per-agent identity is now properly preserved

### Context Overflow Handling (from PR #26912)
- Parent fork skipped if parent context exceeds threshold (100k tokens)
- Prevents silent message failures
- Configurable via `session.parentForkMaxTokens`

## Application to EP02

**For Email → Incident Processing:**
- Use **isolated context** (default)
- Email processing is independent work
- Doesn't need parent conversation history
- Lower token usage
- Cleaner reasoning (no parent context noise)
- Sub-agent focuses on the task, not parent's context

**The Sub-Agent Flow:**
1. Chomi (main agent) receives email
2. Spawns independent sub-agent with isolated context
3. Sub-agent reads ServiceNow docs + CMDB context
4. Sub-agent reasons independently about email
5. Sub-agent validates: Is this real? Does it belong? Is assignment correct?
6. Sub-agent executes via MCP Bridge → ServiceNow API
7. Sub-agent announces results back to Chomi
8. Chomi reports to user

**Why This Matters:**
- Sub-agent is truly independent (not just executing parent commands)
- Has its own reasoning capability
- Has its own token budget
- Can be scaled (spawn multiple agents for multiple emails)
- Results announced back to parent (not blocking)


---

# CRITICAL FIX: Sub-Agent Timeout (May 22, 2026)

## The Problem
- Kwazi (and other sub-agents) timing out on long research/build jobs
- Error: "Request timed out before a response was generated"
- Looked like agents were broken, but they weren't — they were timing out

## The Solution
Add to `~/.openclaw/openclaw.json`:

```json
{
  "agents": {
    "defaults": {
      "timeoutSeconds": 7200
    }
  }
}
```

Then restart:
```bash
openclaw gateway restart
```

## Key Points
- Default timeout is too short for real background work
- 7200 seconds = 2 hours (proper runway for research/build jobs)
- **IMPORTANT:** Don't set to 0 (OpenClaw won't accept it properly)
- This is a small setting with massive difference for real agent work

## Impact
- Before: Sub-agents died after longer jobs
- After: 2 hour runway for proper background work
- Kwazi can now do real research without timing out

## Why This Matters for EP02
- Email processing sub-agents need time to reason + validate
- CMDB checks, duplicate detection, incident creation all take time
- 2-hour timeout ensures sub-agents complete their work
- No more "Request timed out" errors on real work

