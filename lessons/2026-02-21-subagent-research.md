# OpenClaw Multi-Agent & Subagent Research

**Date:** 2026-02-21

## What I Learned

### Multi-Agent Mode (docs.openclaw.ai/concepts/multi-agent)
- This is about running **multiple isolated agents** side-by-side
- Each agent has: own workspace, own auth, own sessions
- Different from subagents/spawning - this is static configuration
- Use `openclaw agents add <name>` to create new agents

### Subagent Spawning Issue
- Error: "gateway closed (1008): pairing required"
- The `subagents` tool IS available (tested)
- But spawn always fails
- Might be related to: pairing requirements, gateway config, or version

### OTEL v2 (from Thaby)
- Thaby mentioned OTEL v2 migration helps with orchestration
- Someone built multi-agent dashboard on OpenClaw (200 stars)
- Might need to look into OpenTelemetry for observability

## Still Missing

- How to dynamically spawn subagents from within a session
- What enables "pairing required" and how to fix it

## SOLVED: Pairing Required Error

**Root cause found (2026-02-21):**
- OpenClaw 2026.2.19-2 introduced new WS security check
- Error "gateway closed (1008): pairing required" is actually:
- "SECURITY ERROR: Gateway URL ws://xxx uses plaintext ws:// to a non-loopback address"
- Happens when using `gateway.bind: "lan"` (needed for GCP VMs)
- Sub-agents can't report back because of this check

**Fix:**
- Rollback to 2026.2.17 (done by Thaby)
- Or wait for: flag to skip check on trusted networks, or "localhost" as valid bind value

## Action Items
- [x] Found root cause - version security check
- [ ] Test subagent spawning after rollback
