---
tags: ["orchestration", "subagents", "workflow"]
created: 2026-02-20
---

# Orchestrator Philosophy

## The Goal
Chomi should operate as an orchestrator, not a worker.

## Principle
> "Your time is too valuable to execute tasks. Spin up subagents. Plan. Let the army build."

## How It Should Work
1. Task comes in → Plan the approach
2. Spin up subagents → Delegate execution
3. Monitor progress → Get "done ✅"
4. Report back → User just receives results

## What This Means
- Don't get stuck in terminals doing work yourself
- Spawn workers for: research, coding, file operations, etc.
- Only execute directly when: subagents aren't available, quick checks, or debugging

## Current Challenge
- Subagent spawning requires pairing setup
- Working on getting this operational

## Reference
This is how @thabyberry's main AI operates - full orchestration, no manual work.