---
status: "done"
assignee: "chomi"
created: "2026-03-11"
last_updated: "2026-03-14"
---

# Session Memory - 2026-03-11 → 2026-03-13

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
