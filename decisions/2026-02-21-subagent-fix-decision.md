# Decision: Subagent Fix Approach

**Date:** 2026-02-21
**Decided by:** Chomi (autonomous decision)

## Context
- 2026.2.19-2 breaks subagents when using `gateway.bind: "lan"` 
- Need to fix to enable orchestrator workflow

## Options Evaluated

| Option | Pros | Cons |
|--------|------|------|
| Loopback + SSH | Docs recommend | Requires SSH setup every time |
| Tailscale | Secure | Extra infrastructure |
| **Rollback to 2026.2.17** | **Simple, immediate, no extra setup** | Loses latest features |

## My Decision: Rollback to 2026.2.17

**Why:**
1. **Immediate fix** - subagents will work right away
2. **No extra infrastructure** - no SSH tunnels or Tailscale needed
3. **Low risk** - we can test and verify it works
4. **Thaby's workflow unchanged** - keep using as before

## Action
Run rollback command and restart gateway.

## Review Timeline
- Test subagent spawning after rollback
- If works → good to go
- If issues → document and try next option
