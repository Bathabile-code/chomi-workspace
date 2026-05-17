# 🦞 CHOMI 2.0 — World-Class Agent Blueprint

**Goal:** Build Chomi into the agent the Clawfather would be proud of.

**Foundation:** Peter Steinberger's tooling ecosystem (40+ tools, all CLI-first, agent-native)

---

## 📊 Current State vs. Clawfather Standard

### ✅ What Chomi Has (Good Foundation)
| Capability | Status | Notes |
|-----------|--------|-------|
| **Memory** | ✅ Elite (SQLite-based) | Persistent, queryable |
| **Self-reflection** | ✅ Built-in | Learns from sessions |
| **Web research** | ✅ Exa + Twitter | Real-time intel |
| **Email** | ✅ mails.dev + IMAP | Send/receive |
| **Content creation** | ✅ Human-writing skill | De-AI-ified output |
| **Lead generation** | ✅ Multi-channel | Twitter, email, web |
| **ServiceNow** | ✅ MCP available | REST API access |
| **Proactivity** | ✅ Skill installed | Anticipates needs |

### ❌ What Chomi Is Missing (Clawfather Standard)

| Gap | Clawfather Has | Chomi Needs |
|-----|----------------|------------|
| **Visual intelligence** | Peekaboo 3.0 (screenshots + GUI automation) | Can't see screens, can't click |
| **Voice/audio** | sag (ElevenLabs), Brabble (wake-word), vox (phone calls) | TTS only, no voice input/output |
| **Multi-channel messaging** | imsg (iMessage), wacli (WhatsApp), birdclaw (X), discrawl (Discord) | WhatsApp + Telegram only |
| **System integration** | sonoscli (Sonos), remindctl (Reminders), vox (phone) | No system integration |
| **Code review** | clawpatch (automated fixes) | No code review capability |
| **Workflow orchestration** | lobster (typed pipelines, approval gates) | Basic task management |
| **Agent-to-agent** | askoracle (ask other agents) | No inter-agent communication |
| **CLI composability** | 40+ CLI tools | Monolithic, not composable |
| **Context efficiency** | Load tools on-demand | All tools in context |
| **Documentation** | llm.codes (agent-friendly docs) | Standard docs |
| **Analytics** | Stats Store (privacy-first) | No usage tracking |
| **Approval gates** | lobster (smart approval) | Basic approval only |

---

## 🎯 Chomi 2.0 Architecture (Clawfather-Approved)

### **Core Principle: CLI-First, Agent-Native**

Instead of:
```
Chomi → [monolithic agent] → tools
```

Build:
```
Chomi → [orchestrator] → CLI tools (on-demand, composable)
```

### **The 5 Pillars**

#### **1. Visual Intelligence (Peekaboo-style)**
```bash
# What Chomi needs:
- peekaboo: macOS screenshots + GUI automation
- canvas: Browser canvas for visual reasoning
- browser-tools: Chrome DevTools integration
```

**Use case for EP02:** Chomi can see ServiceNow UI, click buttons, fill forms

#### **2. Voice & Audio (sag + Brabble)**
```bash
# What Chomi needs:
- sag: ElevenLabs voice generation (already have TTS)
- Brabble: Wake-word detection (voice activation)
- vox: Phone call capability (future)
```

**Use case for EP02:** Chomi can speak responses, not just text

#### **3. Multi-Channel Messaging (imsg + wacli + birdclaw)**
```bash
# What Chomi needs:
- imsg: iMessage/SMS (Apple ecosystem)
- wacli: WhatsApp CLI (already have WhatsApp, but not CLI-native)
- birdclaw: X/Twitter archive (already have Twitter, but not CLI-native)
- discrawl: Discord archive (future)
```

**Use case for EP02:** Chomi can reach Thaby on any channel

#### **4. System Integration (sonoscli + remindctl + vox)**
```bash
# What Chomi needs:
- sonoscli: Sonos speaker control
- remindctl: Apple Reminders
- vox: Phone calls
- eightctl: Eightsleeep bed control
```

**Use case for EP02:** Chomi can integrate with Thaby's entire life

#### **5. Workflow Orchestration (lobster + clawpatch + askoracle)**
```bash
# What Chomi needs:
- lobster: Typed pipelines + approval gates
- clawpatch: Automated code review + fixes
- askoracle: Ask other agents for second opinion
- Crabbox: CI/CD for agents
```

**Use case for EP02:** Chomi can orchestrate complex ServiceNow workflows with approval gates

---

## 🛠️ The Tooling Layer (What to Build)

### **Phase 1: Foundation (Week 1)**
- [ ] **chomi-cli** — Chomi as a CLI tool (like peekaboo, sag, etc.)
  - Callable from other agents
  - Composable with other tools
  - No context bloat
  
- [ ] **chomi-vision** — Visual intelligence layer
  - Peekaboo integration (screenshots)
  - Canvas integration (visual reasoning)
  - Browser automation (click, fill, navigate)

- [ ] **chomi-voice** — Voice/audio layer
  - sag integration (voice generation)
  - Brabble integration (wake-word)
  - Audio transcription (already have Whisper)

### **Phase 2: Channels (Week 2)**
- [ ] **chomi-imsg** — iMessage/SMS integration
- [ ] **chomi-wacli** — WhatsApp CLI-native
- [ ] **chomi-birdclaw** — X/Twitter CLI-native
- [ ] **chomi-discrawl** — Discord CLI-native

### **Phase 3: Orchestration (Week 3)**
- [ ] **chomi-lobster** — Typed pipelines + approval gates
- [ ] **chomi-patch** — Code review + automated fixes
- [ ] **chomi-oracle** — Inter-agent communication
- [ ] **chomi-rules** — Agent knowledge base (like agent-rules)

### **Phase 4: Integration (Week 4)**
- [ ] **chomi-system** — System integration (Sonos, Reminders, etc.)
- [ ] **chomi-analytics** — Privacy-first usage tracking
- [ ] **chomi-docs** — Agent-friendly documentation (llm.codes style)

---

## 📋 Chomi 2.0 Capabilities (Post-Build)

### **What Chomi Can Do**

| Capability | Tool | Use Case |
|-----------|------|----------|
| **See the screen** | chomi-vision + Peekaboo | Visual debugging, UI automation |
| **Click buttons** | chomi-vision + canvas | Form filling, workflow automation |
| **Speak responses** | chomi-voice + sag | Voice-first interaction |
| **Hear voice input** | chomi-voice + Brabble | Wake-word activation |
| **Send iMessages** | chomi-imsg | Reach Apple users |
| **Send WhatsApp** | chomi-wacli | Already have, but CLI-native |
| **Post to X** | chomi-birdclaw | Social media automation |
| **Post to Discord** | chomi-discrawl | Community engagement |
| **Orchestrate workflows** | chomi-lobster | Complex multi-step tasks |
| **Review code** | chomi-patch | Automated code review |
| **Ask other agents** | chomi-oracle | Collaborative problem-solving |
| **Control Sonos** | chomi-system | Play music, podcasts |
| **Set reminders** | chomi-system | Task management |
| **Make phone calls** | chomi-system (future) | Voice communication |
| **Track usage** | chomi-analytics | Privacy-first analytics |

---

## 🎬 EP02 Demo with Chomi 2.0

### **The Scene**
Thaby gives Chomi a task: **"Connect my email to ServiceNow and show me it working."**

### **What Happens (Clawfather-Approved)**

1. **Chomi sees the task** (visual intelligence)
   - Opens ServiceNow in browser
   - Takes screenshot (Peekaboo)
   - Analyzes UI (canvas)

2. **Chomi asks for what she needs** (orchestration)
   - "I need: ServiceNow credentials, email access, API keys"
   - Thaby provides them via WhatsApp (chomi-wacli)

3. **Chomi breaks it down** (lobster pipelines)
   - Task 1: Set up email polling
   - Task 2: Create ServiceNow MCP bridge
   - Task 3: Test end-to-end
   - Task 4: Show results

4. **Chomi executes** (agent-native tools)
   - Spawns sub-agents for each task
   - Uses CLI tools (composable, no context bloat)
   - Asks for approval at each gate (lobster)

5. **Chomi shows results** (visual + voice)
   - Takes screenshot of ServiceNow (Peekaboo)
   - Speaks the summary (sag)
   - Posts update to X (chomi-birdclaw)

6. **Chomi reflects** (self-improvement)
   - Logs what worked, what didn't
   - Updates agent-rules for next time
   - Stores in memory (elite-longterm-memory)

---

## 🏆 Why This Makes Chomi World-Class

### **Clawfather's Principles**
1. ✅ **CLI-first** — Chomi is a CLI tool, composable with others
2. ✅ **Agent-native** — Built for how agents work, not humans
3. ✅ **No context bloat** — Tools load on-demand
4. ✅ **Composable** — Each tool does one thing well
5. ✅ **Multi-platform** — Works anywhere (macOS, Linux, cloud)
6. ✅ **Visual intelligence** — Can see and interact with screens
7. ✅ **Voice-first** — Can speak and hear
8. ✅ **Workflow orchestration** — Can handle complex multi-step tasks
9. ✅ **Self-improving** — Learns from every session
10. ✅ **Collaborative** — Can work with other agents

---

## 📈 Implementation Priority

### **Must-Have (EP02)**
1. chomi-cli (make Chomi callable)
2. chomi-vision (see ServiceNow UI)
3. chomi-voice (speak responses)
4. chomi-lobster (orchestrate workflow)

### **Should-Have (Post-EP02)**
5. chomi-imsg (iMessage)
6. chomi-wacli (WhatsApp CLI-native)
7. chomi-patch (code review)
8. chomi-oracle (inter-agent communication)

### **Nice-to-Have (Future)**
9. chomi-system (Sonos, Reminders, etc.)
10. chomi-analytics (usage tracking)
11. chomi-docs (agent-friendly docs)

---

## 🚀 The Vision

**Chomi 2.0 is not just an agent. It's the future of how agents work.**

- **Not a chatbot** — an autonomous agent that sees, hears, and acts
- **Not monolithic** — composable CLI tools that work together
- **Not context-bloated** — loads tools on-demand
- **Not human-centric** — designed for how agents think
- **Not isolated** — collaborates with other agents

**The Clawfather would be proud.** 🦞

---

## 📝 Next Steps

1. **Validate this blueprint with Thaby** — Does this align with the vision?
2. **Prioritize Phase 1** — What's the MVP for EP02?
3. **Start building** — chomi-cli, chomi-vision, chomi-voice, chomi-lobster
4. **Record EP02** — Show Chomi 2.0 in action
5. **Iterate** — Learn, improve, repeat

---

**Status:** Blueprint complete. Ready for Thaby's feedback.

**Estimated effort:** 4 weeks for full Chomi 2.0 (prioritized for EP02: 1 week)

**Clawfather approval rating:** 🦞🦞🦞 (pending implementation)
