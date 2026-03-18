---
status: "done"
assignee: "chomi"
created: "2026-03-11"
last_updated: "2026-03-18"
---

# Session Memory - 2026-03-18

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
