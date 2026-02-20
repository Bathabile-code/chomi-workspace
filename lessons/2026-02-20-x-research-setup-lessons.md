---
tags: ["x-research", "twitterapi", "lessons"]
created: "2026-02-20"
---

# x-research-but-cheaper Setup Lessons

## What We Learned

### 1. Task Location Matters
- Mission Control reads from `~/ChomiVaultSetup/tasks/`
- NOT from `~/.openclaw/workspace/tasks/`
- Had to create task in correct location for it to show on board

### 2. TwitterAPI.io Rate Limits
- Free tier = 1 request per 5 seconds
- Multiple rapid requests = 429 errors
- Need to space queries or upgrade for daily automation

### 3. Environment Variables
- Gateway doesn't automatically inherit shell env vars
- Need to pass TWITTERAPI_KEY inline or configure in gateway
- Works when passed directly in command

### 4. Subagent Spawning
- Requires pairing to be configured
- Can't spawn subagents without proper gateway setup

## Action Items
- Consider TwitterAPI.io paid tier (~$10/mo)
- Create symlinks in ChomiVaultSetup for projects
- Set up proper cron for daily research