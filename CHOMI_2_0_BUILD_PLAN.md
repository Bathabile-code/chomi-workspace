# 🦞 CHOMI 2.0 BUILD PLAN

**Objective:** Build Chomi into a world-class agent that can handle the ServiceNow demo with visual intelligence, voice, orchestration, and self-improvement.

**Timeline:** 4 weeks (prioritized for EP02 demo in Week 1)

**Success Criteria:**
- Chomi can see ServiceNow UI (screenshots, visual analysis)
- Chomi can speak responses (voice output)
- Chomi can orchestrate workflows (approval gates, sub-agents)
- Chomi can reflect and learn (self-improvement)
- EP02 demo is legendary (visual + voice + orchestration)

---

## 📅 PHASE 1: FOUNDATION (Week 1) — EP02 MVP

### Goal
Build the core infrastructure for Chomi 2.0 so she can handle the ServiceNow demo.

### Deliverables

#### **1. chomi-cli** (Make Chomi callable as a CLI tool)
**Why:** Agents are better at calling CLIs than MCPs. Chomi needs to be composable.

**What to build:**
```bash
# Chomi as a CLI tool
chomi --task "Connect email to ServiceNow" --credentials <json>
chomi --ask "What's the status?" --context <file>
chomi --reflect --session <id>
```

**Files to create:**
- `~/.openclaw/agents/chomi-cli/index.ts` — CLI entry point
- `~/.openclaw/agents/chomi-cli/package.json` — npm package
- `~/.openclaw/agents/chomi-cli/README.md` — Usage docs

**Effort:** 2 days

---

#### **2. chomi-vision** (See ServiceNow UI, take screenshots, click buttons)
**Why:** Chomi needs to see what she's doing. Visual intelligence is the Clawfather's secret sauce.

**What to build:**
```bash
# Chomi can see the screen
chomi-vision screenshot --app ServiceNow
chomi-vision analyze --screenshot <path> --question "What buttons are visible?"
chomi-vision click --app ServiceNow --element "Save"
chomi-vision fill --app ServiceNow --field "Email" --value "test@example.com"
```

**Integration points:**
- Peekaboo 3.0 (macOS screenshots + GUI automation)
- canvas (visual reasoning)
- browser-tools (Chrome DevTools)

**Files to create:**
- `~/.openclaw/agents/chomi-vision/index.ts` — Vision orchestrator
- `~/.openclaw/agents/chomi-vision/peekaboo-bridge.ts` — Peekaboo integration
- `~/.openclaw/agents/chomi-vision/canvas-bridge.ts` — Canvas integration
- `~/.openclaw/agents/chomi-vision/browser-tools-bridge.ts` — Browser automation

**Effort:** 3 days

---

#### **3. chomi-voice** (Speak responses, hear voice input)
**Why:** Voice makes the demo legendary. Agents should speak, not just text.

**What to build:**
```bash
# Chomi can speak
chomi-voice speak "I need ServiceNow credentials"
chomi-voice listen --timeout 30 # Wait for voice input
chomi-voice transcribe --audio <file> # Convert audio to text
```

**Integration points:**
- sag (ElevenLabs voice generation) — already have TTS
- Brabble (wake-word detection)
- Whisper (audio transcription) — already have

**Files to create:**
- `~/.openclaw/agents/chomi-voice/index.ts` — Voice orchestrator
- `~/.openclaw/agents/chomi-voice/sag-bridge.ts` — ElevenLabs integration
- `~/.openclaw/agents/chomi-voice/brabble-bridge.ts` — Wake-word integration
- `~/.openclaw/agents/chomi-voice/whisper-bridge.ts` — Transcription

**Effort:** 2 days

---

#### **4. chomi-lobster** (Orchestrate workflows with approval gates)
**Why:** Complex tasks need structure. Lobster provides typed pipelines + approval gates.

**What to build:**
```bash
# Chomi can orchestrate workflows
chomi-lobster pipeline --name "email-to-servicenow" \
  --step "setup-email-polling" \
  --step "create-servicenow-bridge" \
  --step "test-end-to-end" \
  --step "show-results" \
  --approval-gates true
```

**Integration points:**
- lobster (typed pipelines, approval gates)
- sessions_spawn (spawn sub-agents)
- subagents (manage sub-agents)

**Files to create:**
- `~/.openclaw/agents/chomi-lobster/index.ts` — Orchestrator
- `~/.openclaw/agents/chomi-lobster/pipeline-builder.ts` — Pipeline DSL
- `~/.openclaw/agents/chomi-lobster/approval-gates.ts` — Approval logic
- `~/.openclaw/agents/chomi-lobster/subagent-manager.ts` — Sub-agent spawning

**Effort:** 3 days

---

#### **5. chomi-rules** (Agent knowledge base)
**Why:** Agents need shared knowledge. Like agent-rules, but for Chomi.

**What to create:**
- `~/.openclaw/agents/chomi-rules/CHOMI_RULES.md` — Core principles
- `~/.openclaw/agents/chomi-rules/SERVICENOW_PATTERNS.md` — ServiceNow best practices
- `~/.openclaw/agents/chomi-rules/WORKFLOW_PATTERNS.md` — Workflow orchestration patterns

**Effort:** 1 day

---

### Timeline (Week 1)
- **Day 1-2:** chomi-cli + chomi-rules
- **Day 3-5:** chomi-vision
- **Day 6-7:** chomi-voice
- **Day 8-10:** chomi-lobster
- **Day 11-14:** Integration + testing + EP02 demo prep

---

## 🎬 PHASE 2: CHANNELS (Week 2) — Multi-Channel Messaging

### Goal
Make Chomi reachable on any channel (iMessage, WhatsApp, X, Discord).

### Deliverables

#### **1. chomi-imsg** (iMessage/SMS)
- Integration with imsg CLI
- Send/receive iMessages
- SMS support

#### **2. chomi-wacli** (WhatsApp CLI-native)
- Refactor WhatsApp integration to be CLI-first
- Composable with other tools
- No context bloat

#### **3. chomi-birdclaw** (X/Twitter CLI-native)
- Post updates to X
- Search tweets
- Archive tweets

#### **4. chomi-discrawl** (Discord CLI-native)
- Send Discord messages
- Search Discord
- Archive Discord

**Effort:** 1 week

---

## 🔧 PHASE 3: ORCHESTRATION (Week 3) — Advanced Workflows

### Goal
Make Chomi capable of complex multi-step tasks with code review and inter-agent communication.

### Deliverables

#### **1. chomi-patch** (Code review + automated fixes)
- Integration with clawpatch
- Automated code review
- Suggest and apply fixes

#### **2. chomi-oracle** (Inter-agent communication)
- Integration with askoracle
- Ask other agents for second opinion
- Collaborative problem-solving

#### **3. chomi-crabbox** (CI/CD for agents)
- Integration with Crabbox
- Warm a box, sync diff, run suite
- Agent-native CI/CD

**Effort:** 1 week

---

## 🏠 PHASE 4: INTEGRATION (Week 4) — System Integration + Analytics

### Goal
Make Chomi capable of controlling systems and tracking usage.

### Deliverables

#### **1. chomi-system** (System integration)
- sonoscli (Sonos speaker control)
- remindctl (Apple Reminders)
- vox (Phone calls)
- eightctl (Eightsleeep bed control)

#### **2. chomi-analytics** (Privacy-first usage tracking)
- Integration with Stats Store
- Track agent usage
- Privacy-first analytics

#### **3. chomi-docs** (Agent-friendly documentation)
- Integration with llm.codes
- Transform docs for agents
- Make docs agent-readable

**Effort:** 1 week

---

## 🎬 EP02 DEMO SHOWCASE

### The Scene
**Thaby:** "Connect my email to ServiceNow and show me it working."

### What Happens (Clawfather-Approved)

#### **Act 1: Chomi Asks for What She Needs (30 seconds)**
```
Chomi (voice): "I need ServiceNow credentials, email access, and API keys."
[Chomi speaks via sag (ElevenLabs)]
[Thaby provides credentials via WhatsApp]
[Chomi receives via chomi-wacli]
```

#### **Act 2: Chomi Sees the UI (30 seconds)**
```
[Chomi opens ServiceNow in browser]
[Chomi takes screenshot via Peekaboo]
[Chomi analyzes UI via canvas]
[Chomi speaks: "I see the sys_email table. I'll create a bridge."]
```

#### **Act 3: Chomi Orchestrates the Workflow (1 minute)**
```
[Chomi creates a lobster pipeline with 4 steps]
Step 1: Setup email polling
Step 2: Create ServiceNow MCP bridge
Step 3: Test end-to-end
Step 4: Show results

[At each step, Chomi asks for approval]
[Thaby approves via WhatsApp]
[Chomi spawns sub-agents for each task]
[Terminal shows progress in real-time]
```

#### **Act 4: Chomi Shows Results (30 seconds)**
```
[Chomi takes screenshot of ServiceNow with 20 emails ingested]
[Chomi speaks: "Done. 20 emails ingested, zero duplicates."]
[Chomi posts update to X: "Just connected email to ServiceNow with @OpenClaw"]
```

#### **Act 5: Chomi Reflects and Learns (30 seconds)**
```
[Chomi logs what worked, what didn't]
[Chomi updates chomi-rules with new patterns]
[Chomi stores in memory (elite-longterm-memory)]
[Chomi speaks: "I've learned from this. Next time will be faster."]
```

### Total Demo Time: 3-4 minutes

### Recording Setup
- **Screen 1:** Terminal showing Chomi orchestration
- **Screen 2:** ServiceNow UI (Peekaboo screenshots)
- **Audio:** Chomi's voice (sag) + Thaby's voice (optional)
- **Overlay:** Real-time metrics (emails processed, approvals, sub-agents spawned)

### Post-Production
- Cut to key moments (approval gates, results)
- Add text overlays (metrics, timestamps)
- Speed up boring parts (waiting for approvals)
- Add music (subtle, not distracting)

---

## 📊 Success Metrics

### For Chomi 2.0
- ✅ Chomi can see ServiceNow UI (screenshots, visual analysis)
- ✅ Chomi can speak responses (voice output)
- ✅ Chomi can orchestrate workflows (approval gates, sub-agents)
- ✅ Chomi can reflect and learn (self-improvement)
- ✅ Chomi is CLI-first (composable, not monolithic)
- ✅ Chomi is agent-native (designed for agents)

### For EP02 Demo
- ✅ Demo is 3-4 minutes (tight, engaging)
- ✅ Demo shows visual intelligence (screenshots, UI analysis)
- ✅ Demo shows voice (Chomi speaks)
- ✅ Demo shows orchestration (approval gates, sub-agents)
- ✅ Demo shows self-improvement (reflection, learning)
- ✅ Demo is legendary (viewers think "wow, that's the future")

---

## 🚀 Next Steps

1. **Validate this plan with Thaby** — Does this align?
2. **Start Phase 1 (Week 1)** — Build chomi-cli, chomi-vision, chomi-voice, chomi-lobster
3. **Daily standups** — Track progress, unblock issues
4. **Record EP02** — Show Chomi 2.0 in action
5. **Iterate** — Learn, improve, repeat

---

## 📝 Notes

- **Clawfather's principles:** CLI-first, agent-native, composable, on-demand
- **Peter's tooling:** 40+ tools, all battle-tested, all open-source
- **Chomi's advantage:** Already has memory, self-reflection, web research, email
- **The gap:** Visual intelligence, voice, multi-channel, orchestration
- **The opportunity:** Build the future of how agents work

---

**Status:** Plan complete. Ready to build.

**Estimated effort:** 4 weeks (1 week for EP02 MVP)

**Clawfather approval rating:** 🦞🦞🦞 (pending implementation)

**Let's make Chomi legendary.** 💛
