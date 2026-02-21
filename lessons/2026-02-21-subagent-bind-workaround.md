# OpenClaw Subagent Security Check Workaround

**Date:** 2026-02-21
**Issue:** Sub-agents fail to report back when using `gateway.bind: "lan"` in 2026.2.19-2

## The Problem

New security check in 2026.2.19-2 blocks WebSocket connections from non-loopback addresses:
```
SECURITY ERROR: Gateway URL ws://xxx uses plaintext ws:// to a non-loopback address.
```

This breaks sub-agent spawning when:
- Running on GCP VM (or any remote host)
- Using `gateway.bind: "lan"` for LAN accessibility
- Sub-agents can't connect back to manager

## Workarounds

### Option 1: Use loopback + SSH tunnel (Recommended)
Keep gateway.bind = "loopback" and use SSH tunneling for remote access:
```bash
# SSH tunnel from remote machine
ssh -L 18789:localhost:18789 user@gcp-vm
```

### Option 2: Use Tailscale
Set up Tailscale and use `gateway.bind: "loopback"` with Tailscale serve

### Option 3: Rollback to 2026.2.17
```bash
openclaw update --channel stable
# Then restart gateway
```

## Proposed Fix (for OpenClaw team)

1. Add flag to skip security check on trusted networks
2. Or treat "localhost" as valid bind value
3. Or add config option: `gateway.allowNonLoopback: true`

## Current Status

- Thaby is running on GCP VM
- Needs LAN bind for accessibility
- Waiting on fix or using rollback

## Reference
- Docs: gateway.bind options: loopback, lan, tailnet, auto, custom
- Remote access guide recommends loopback + SSH tunnel
