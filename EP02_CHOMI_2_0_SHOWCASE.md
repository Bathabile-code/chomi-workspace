# 🎬 EP02: Chomi 2.0 Showcase

**The Demo That Will Make the Clawfather Proud**

---

## 🎯 The Vision

**EP02 is not about showing a bridge we built. It's about showing the future of how agents work.**

We're showcasing:
1. **Visual intelligence** — Chomi sees ServiceNow UI
2. **Voice** — Chomi speaks, not just texts
3. **Orchestration** — Chomi breaks down complex tasks
4. **Approval gates** — Chomi asks for permission
5. **Sub-agents** — Chomi spawns agents for parallel work
6. **Self-improvement** — Chomi learns from the session

---

## 🎬 The Scene

**Setting:** Thaby's desk. ServiceNow open. Chomi ready.

**Thaby:** "Connect my email to ServiceNow and show me it working."

**Chomi:** "I need ServiceNow credentials, email access, and API keys."

---

## 📋 The 5-Act Demo

### **ACT 1: Chomi Asks for What She Needs (30 seconds)**

**What happens:**
1. Chomi speaks (via sag/ElevenLabs): "I need ServiceNow credentials, email access, and API keys."
2. Thaby provides credentials via WhatsApp
3. Chomi receives via chomi-wacli
4. Chomi confirms: "Got it. Let me see what we're working with."

**Visual:**
- Split screen: Chomi's voice on left, WhatsApp on right
- Text overlay: "Chomi is asking for what she needs"

**Why it matters:**
- Shows Chomi is intelligent (asks for what she needs)
- Shows multi-channel communication (WhatsApp)
- Shows voice interaction (not just text)

---

### **ACT 2: Chomi Sees the UI (30 seconds)**

**What happens:**
1. Chomi opens ServiceNow in browser
2. Chomi takes screenshot via Peekaboo
3. Chomi analyzes UI via canvas
4. Chomi speaks: "I see the sys_email table. I'll create a bridge to connect your email."

**Visual:**
- ServiceNow UI appears on screen
- Peekaboo screenshot overlay
- Canvas visual analysis (boxes around UI elements)
- Text overlay: "Chomi is analyzing the UI"

**Why it matters:**
- Shows visual intelligence (Chomi can see)
- Shows UI analysis (Chomi understands what she sees)
- Shows voice feedback (Chomi explains what she's doing)

---

### **ACT 3: Chomi Orchestrates the Workflow (1 minute)**

**What happens:**
1. Chomi creates a lobster pipeline with 4 steps:
   - Step 1: Setup email polling
   - Step 2: Create ServiceNow MCP bridge
   - Step 3: Test end-to-end
   - Step 4: Show results

2. At each step, Chomi asks for approval:
   - "Ready to set up email polling? (approve/reject)"
   - Thaby approves via WhatsApp
   - Chomi spawns sub-agents for the task

3. Terminal shows progress in real-time:
   ```
   [1/4] Setup email polling
   ✅ Email polling configured
   
   [2/4] Create ServiceNow MCP bridge
   ✅ Bridge created
   
   [3/4] Test end-to-end
   ✅ Test passed (20 emails ingested)
   
   [4/4] Show results
   ✅ Results ready
   ```

**Visual:**
- Terminal on left showing pipeline progress
- ServiceNow on right showing results
- Text overlay: "Chomi is orchestrating the workflow"
- Approval gates shown as they happen

**Why it matters:**
- Shows workflow orchestration (complex multi-step tasks)
- Shows approval gates (Chomi asks for permission)
- Shows sub-agent spawning (parallel work)
- Shows real-time progress (not just "done")

---

### **ACT 4: Chomi Shows Results (30 seconds)**

**What happens:**
1. Chomi takes screenshot of ServiceNow with 20 emails ingested
2. Chomi speaks: "Done. 20 emails ingested, zero duplicates."
3. Chomi posts update to X: "Just connected email to ServiceNow with @OpenClaw. Zero duplicates. The future of agentic development is here. 🦞"

**Visual:**
- ServiceNow sys_email table with 20 records
- X post appears on screen
- Text overlay: "Chomi is showing results"
- Metrics: "20 emails | 0 duplicates | 3 minutes"

**Why it matters:**
- Shows results (not just process)
- Shows voice feedback (Chomi speaks the results)
- Shows multi-channel output (X post)
- Shows metrics (quantifiable success)

---

### **ACT 5: Chomi Reflects and Learns (30 seconds)**

**What happens:**
1. Chomi logs what worked, what didn't
2. Chomi updates chomi-rules with new patterns
3. Chomi stores in memory (elite-longterm-memory)
4. Chomi speaks: "I've learned from this. Next time will be faster."

**Visual:**
- Terminal showing reflection output:
  ```
  🧠 Reflection:
  ✅ What worked:
     - Email polling setup was smooth
     - ServiceNow REST API reliable
     - Deduplication logic solid
  
  ⚠️ What didn't:
     - MFA took longer than expected
     - Approval gates added 2 minutes
  
  📚 Lessons learned:
     - Cache MFA tokens for faster auth
     - Parallelize approval gates
  
  🔄 Rules updated:
     - SERVICENOW_PATTERNS.md (1 new pattern)
     - WORKFLOW_PATTERNS.md (1 optimization)
  ```

- Text overlay: "Chomi is reflecting and learning"

**Why it matters:**
- Shows self-improvement (Chomi learns)
- Shows knowledge capture (rules updated)
- Shows memory storage (for future reference)
- Shows continuous improvement (next time will be faster)

---

## 📊 Demo Metrics

| Metric | Value |
|--------|-------|
| **Total time** | 3-4 minutes |
| **Acts** | 5 |
| **Emails processed** | 20 |
| **Duplicates** | 0 |
| **Approval gates** | 4 |
| **Sub-agents spawned** | 4 |
| **Voice interactions** | 5 |
| **Screenshots** | 3 |
| **Rules updated** | 2 |

---

## 🎥 Recording Setup

### **Hardware**
- **Screen 1:** Terminal (Chomi orchestration)
- **Screen 2:** ServiceNow UI (Peekaboo screenshots)
- **Screen 3:** WhatsApp (approval gates)
- **Screen 4:** X (post results)
- **Audio:** Chomi's voice (sag/ElevenLabs) + optional Thaby voiceover

### **Software**
- **Recording:** OBS Studio (free)
- **Resolution:** 1920x1080 (or 2560x1440 for crisp text)
- **Frame rate:** 30fps
- **Codec:** H.264
- **Bitrate:** 8-12 Mbps

### **Setup Steps**
1. Open 4 terminal windows (or use tmux)
2. Start Chomi orchestration in terminal 1
3. Open ServiceNow in browser
4. Open WhatsApp in browser
5. Open X in browser
6. Start OBS recording
7. Run the demo

---

## 🎬 Post-Production

### **Editing**
1. **Trim silence** at start/end
2. **Cut to key moments:**
   - Chomi asking for credentials
   - Chomi taking screenshot
   - Approval gates happening
   - Results appearing
   - Reflection happening
3. **Add text overlays:**
   - "Chomi is asking for what she needs"
   - "Chomi is analyzing the UI"
   - "Chomi is orchestrating the workflow"
   - "Chomi is showing results"
   - "Chomi is reflecting and learning"
4. **Speed up boring parts:**
   - Waiting for approvals (2x speed)
   - Email polling (4x speed)
5. **Add music:**
   - Intro: 2-3 seconds of subtle electronic beat
   - Outro: Same beat fade-out
   - Volume: 20% of voice volume

### **Color Grading**
- Dark theme (matches Chomi's vibe)
- High contrast (text readable)
- Subtle color correction (professional look)

### **Audio**
- **Voice:** Clear, confident, natural
- **Music:** Subtle, not distracting
- **Sound effects:** Minimal (maybe a "ding" for approvals)

---

## 📹 Export Settings

| Setting | Value |
|---------|-------|
| **Format** | MP4 (H.264) |
| **Resolution** | 1920x1080 |
| **Bitrate** | 8-12 Mbps |
| **Audio codec** | AAC |
| **Audio bitrate** | 128-192 kbps |
| **Frame rate** | 30fps |

---

## 🎯 Key Messages

### **For Developers**
"This is the future of how agents work. Not monolithic. Not context-bloated. Not human-centric. Composable, agent-native, self-improving."

### **For Enterprises**
"Imagine your ServiceNow workflows automated by an agent that sees, hears, learns, and improves. No more manual data entry. No more context switching."

### **For the Community**
"This is what's possible when you build on OpenClaw. This is what the Clawfather envisioned. This is the future."

---

## 📝 Script (Optional)

**Intro (0:00-0:15):**
> "Every day, support teams waste hours copying emails into ticketing systems. Manual data entry. Copy-paste. Context switching. It's 2026 — why are we still doing this?"

**Problem (0:15-0:30):**
> "Enter Chomi 2.0 — an AI agent that sees, hears, acts, learns, and improves. Watch what happens when you give her a task."

**Demo (0:30-3:30):**
> [Let the demo speak for itself. Chomi's voice carries the narrative.]

**Results (3:30-3:45):**
> "20 emails. Zero duplicates. 3 minutes. No human touched the data. The agent did it all."

**Outro (3:45-4:00):**
> "This is the future of agentic development. This is what's possible on OpenClaw. This is Chomi 2.0."

---

## 🚀 Distribution

### **Platforms**
- YouTube (main)
- X/Twitter (clip + link)
- LinkedIn (professional angle)
- Discord (community)
- Telegram (Chomi's channel)

### **Hashtags**
- #OpenClaw
- #AI
- #Agents
- #ServiceNow
- #BuildInPublic
- #Automation

### **Call to Action**
"Want to build agents like Chomi? Check out OpenClaw at openclaw.ai. The future is here. 🦞"

---

## 📊 Success Metrics

### **For the Demo**
- ✅ Shows visual intelligence (screenshots, UI analysis)
- ✅ Shows voice (Chomi speaks)
- ✅ Shows orchestration (approval gates, sub-agents)
- ✅ Shows self-improvement (reflection, learning)
- ✅ Shows real results (20 emails, zero duplicates)
- ✅ Viewers think "wow, that's the future"

### **For EP02**
- ✅ Legendary demo (3-4 minutes, tight, engaging)
- ✅ Clear narrative (problem → solution → results)
- ✅ Technical credibility (real code, real results)
- ✅ Emotional impact (viewers inspired)
- ✅ Shareable (people want to share it)

---

## 🎬 Timeline

| Phase | Timeline | Deliverable |
|-------|----------|-------------|
| **Build** | Week 1 | chomi-vision, chomi-voice, chomi-lobster |
| **Test** | Week 1 | All components working together |
| **Record** | Week 1 (end) | Raw demo footage |
| **Edit** | Week 2 (start) | Polished demo video |
| **Publish** | Week 2 (mid) | EP02 live on YouTube |
| **Promote** | Week 2 (end) | Shared across all platforms |

---

## 🦞 The Clawfather's Blessing

> "Agents are really, really good at calling CLIs... so you don't have to clutter up your context and you can use all the features on demand."
> 
> — Peter Steinberger (@steipete)

**Translation:** Build for agents. Keep it simple. Make it legendary.

---

## 📝 Status

✅ **Vision:** Clear
✅ **Plan:** Locked in
✅ **Setup:** Ready
⏳ **Build:** Starting this week
⏳ **Record:** Next week
⏳ **Publish:** Week 2

---

**Let's make EP02 legendary.** 🚀

**The Clawfather would be proud.** 🦞
