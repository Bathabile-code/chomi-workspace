# 🎬 EP02: "Build With Me" — End-to-End Execution Plan

**Platform:** LinkedIn
**Format:** No face, agents do everything
**Output:** 1-2 min clip + lengthy article
**Timeline:** 2 hours total (build + capture + edit + publish)

---

## 🎯 THE VISION

**Hook:** "I gave my AI agent a task. She built a ServiceNow integration in 20 minutes. Here's what happened."

**The Story:**
1. Thaby gives Chomi a task
2. Chomi asks for what she needs
3. Chomi builds the integration (real-time)
4. Chomi shows results
5. Chomi reflects and learns

**The Message:** This is how we build with agents. Not months. Minutes.

---

## 📋 PHASE 1: PREPARATION (10 minutes)

### **Step 1.1: Environment Setup**
```bash
# Open terminal
# Open code editor (VS Code)
# Start recording (asciinema or ffmpeg)
# Have credentials ready
```

**Thaby does:**
- [ ] Open terminal
- [ ] Open VS Code
- [ ] Set ServiceNow credentials in env vars
- [ ] Start screen recording

**Chomi does:**
- [ ] Verify all tools installed
- [ ] Check ElevenLabs API key
- [ ] Test voice generation
- [ ] Confirm ServiceNow instance is awake

---

## 📋 PHASE 2: THE BUILD (30 minutes)

### **Step 2.1: Act 1 — The Ask (5 minutes)**

**What happens:**
```
Thaby: "Connect my email to ServiceNow"
Chomi: "I need ServiceNow credentials, email access, and API keys"
```

**What we record:**
- Thaby typing the task
- Chomi responding (text + voice)
- Chomi asking for credentials

**Thaby says (voiceover or text):**
> "So here's the task. Connect my email to ServiceNow. Let's see what Chomi does."

**Chomi responds:**
> "I need ServiceNow credentials, email access, and API keys."

**Recording:** Terminal showing the interaction

---

### **Step 2.2: Act 2 — The Build (15 minutes)**

**What happens:**
```
Chomi builds:
├── Real ServiceNow integration (MCP)
│   ├── servicenow-mcp.js
│   ├── Health check
│   ├── Get emails
│   ├── Create records
│   └── Duplicate detection
├── Demo layer (CLI)
│   ├── chomi-demo.sh
│   ├── 5-act structure
│   └── Voice integration
└── Test everything
```

**What we record:**
- Code being written in real-time
- Terminal commands
- API responses
- Errors and fixes (authentic!)

**Thaby says:**
> "Chomi is building the real integration now. ServiceNow MCP. REST API calls. Let's watch."

**Key moments to capture:**
1. Writing `servicenow-mcp.js`
2. Testing health check
3. Real API response from ServiceNow
4. Writing `chomi-demo.sh`
5. Testing voice generation
6. Running end-to-end test

**Recording:** Terminal + code editor (split screen)

---

### **Step 2.3: Act 3 — The Results (10 minutes)**

**What happens:**
```
Chomi: "Done. 20 emails ingested, zero duplicates."
```

**What we record:**
- Demo script running
- ServiceNow table showing records
- Voice announcing results
- Metrics displayed

**Thaby says:**
> "And there it is. 20 emails. Zero duplicates. 3 minutes."

**Key moments:**
1. Pipeline completing
2. ServiceNow sys_email table
3. Voice: "Done. 20 emails ingested."
4. Metrics: 20 emails, 0 duplicates, 3 min

**Recording:** Terminal showing results + ServiceNow UI

---

## 📋 PHASE 3: CAPTURE (20 minutes)

### **Step 3.1: Terminal Recording**
```bash
# Using asciinema (simple)
asciinema rec build.cast

# Or using ffmpeg (better quality)
ffmpeg -f x11grab -r 30 -s 1920x1080 -i :0.0 build.mp4
```

**What we capture:**
- Full build process
- All terminal output
- Code being written
- Real API responses

---

### **Step 3.2: Screenshots at Key Moments**
```bash
# Key moments to screenshot:
# 1. Chomi asking for credentials
# 2. Code being written
# 3. API response from ServiceNow
# 4. Pipeline completing
# 5. ServiceNow table with records
# 6. Final metrics
```

**Agent task:** Auto-capture screenshots at milestones

---

### **Step 3.3: Voice Recording**
```bash
# Record Thaby's commentary (optional)
# Or use ElevenLabs for voiceover
# Or use text overlays instead
```

**Options:**
1. **Thaby voice** — Authentic, personal
2. **ElevenLabs** — Consistent, professional
3. **Text only** — Simple, accessible

**Recommendation:** Text overlays for LinkedIn (silent video friendly)

---

## 📋 PHASE 4: EDITING (20 minutes)

### **Step 4.1: Create Highlight Clip (1-2 minutes)**
```bash
# Extract key moments from recording
ffmpeg -i build.mp4 -ss 00:02:00 -t 00:02:00 -c copy highlight.mp4

# Or use asciinema
asciinema convert build.cast highlight.gif
```

**Clip structure:**
1. **0:00-0:10** — The Ask (Thaby gives task)
2. **0:10-0:40** — The Build (fast-forward code writing)
3. **0:40-1:00** — The Results (ServiceNow table, metrics)
4. **1:00-1:10** — The Reflection (Chomi learns)
5. **1:10-1:20** — Outro ("Built with OpenClaw")

**Editing:**
- Fast-forward boring parts (10x speed)
- Highlight key moments (normal speed)
- Add text overlays
- Add music (subtle)

---

### **Step 4.2: Add Text Overlays**
```bash
# Add text to video
ffmpeg -i highlight.mp4 -vf "
drawtext=text='The Task: Connect email to ServiceNow':x=10:y=10:fontsize=24:fontcolor=white,
drawtext=text='The Build: 20 minutes':x=10:y=40:fontsize=24:fontcolor=white,
drawtext=text='The Result: 20 emails, 0 duplicates':x=10:y=70:fontsize=24:fontcolor=white
" final.mp4
```

**Text overlays:**
- "The Task: Connect email to ServiceNow"
- "The Build: Real-time agentic development"
- "The Result: 20 emails ingested, 0 duplicates"
- "The Time: 3 minutes"
- "Built with OpenClaw 🦞"

---

## 📋 PHASE 5: ARTICLE (20 minutes)

### **Step 5.1: Write LinkedIn Article**

**Title:** "I Gave My AI Agent a Task. She Built a ServiceNow Integration in 20 Minutes."

**Structure:**

**Hook (Paragraph 1):**
> Every day, support teams waste hours copying emails into ServiceNow. Manual data entry. Context switching. It's 2026. Why are we still doing this?

**The Task (Paragraph 2):**
> I gave my AI agent, Chomi, a simple instruction: "Connect my email to ServiceNow."

**The Process (Paragraphs 3-6):**
> Here's what she did:
> 1. Asked for credentials and access
> 2. Analyzed the ServiceNow UI
> 3. Built a 4-step workflow pipeline
> 4. Integrated 20 emails with zero duplicates
> 5. Reflected on what worked and what didn't

**The Tech (Paragraphs 7-9):**
> Built with OpenClaw. Hybrid architecture:
> - CLI layer for speed and visualization
> - MCP layer for production reliability
> - ElevenLabs for voice interaction
> - Peekaboo for visual intelligence

**The Result (Paragraph 10):**
> 20 minutes. Working integration. Zero manual work.

**The Future (Paragraph 11):**
> This is agentic development. Not months. Minutes. Not manual. Automated. Not human-centric. Agent-native.

**Call to Action (Paragraph 12):**
> What would you build if you had an agent that could do this?

**Hashtags:** #BuildInPublic #OpenClaw #AI #ServiceNow #Automation #AgenticDevelopment

---

## 📋 PHASE 6: REVIEW (10 minutes)

### **Step 6.1: Thuluzi Reviews**
```
Thuluzi checks:
├── Clip quality
├── Article accuracy
├── Technical correctness
├── Brand consistency
└── LinkedIn optimization
```

**Thuluzi says:**
> "Clip is tight. Article is compelling. Ready to publish."

---

### **Step 6.2: Thaby Approves**
```
Thaby reviews:
├── Watches clip
├── Reads article
├── Approves or requests changes
└── Gives final go-ahead
```

**Thaby says:**
> "This is fire. Let's post it."

---

## 📋 PHASE 7: PUBLISH (5 minutes)

### **Step 7.1: Post on LinkedIn**
```
Thaby:
├── Uploads clip (1-2 min)
├── Pastes article
├── Adds hashtags
├── Tags relevant people
└── Hits publish
```

**Post format:**
- **Video:** 1-2 min clip
- **Text:** Article (800-1200 words)
- **Hashtags:** #BuildInPublic #OpenClaw #AI #ServiceNow
- **Tags:** @OpenClaw @ServiceNow

---

### **Step 7.2: Engage**
```
Thaby:
├── Responds to comments
├── Answers questions
├── Shares in relevant groups
└── Cross-posts to X/Twitter
```

**Engagement strategy:**
- Respond within 1 hour
- Answer technical questions
- Share behind-the-scenes details
- Invite discussion

---

## 📊 SUCCESS METRICS

### **For the Clip**
- ✅ 1-2 minutes
- ✅ Shows real build process
- ✅ Text overlays (no voice needed)
- ✅ Professional but authentic
- ✅ Silent-video friendly

### **For the Article**
- ✅ 800-1200 words
- ✅ Technical but accessible
- ✅ Shows process and results
- ✅ Includes call to action
- ✅ Optimized for LinkedIn

### **For the Post**
- ✅ Engaging hook
- ✅ Clear value proposition
- ✅ Visual element (clip)
- ✅ Discussion starter
- ✅ Cross-platform potential

---

## 🚀 EXECUTION CHECKLIST

### **Before We Start**
- [ ] ServiceNow instance is awake
- [ ] Credentials ready
- [ ] ElevenLabs API key working
- [ ] Terminal recording setup
- [ ] VS Code open

### **During Build**
- [ ] Record everything
- [ ] Capture screenshots
- [ ] Note key moments
- [ ] Be authentic (mistakes are okay!)

### **After Build**
- [ ] Create highlight clip
- [ ] Add text overlays
- [ ] Write article
- [ ] Review and approve
- [ ] Publish on LinkedIn

---

## 🎯 THE HOOK

**The opening line of the article:**
> "I gave my AI agent a task. She built a ServiceNow integration in 20 minutes. Here's what happened."

**The opening frame of the clip:**
> Text: "The Task: Connect email to ServiceNow"
> Terminal: Thaby typing the instruction

**The closing frame:**
> Text: "20 emails. 0 duplicates. 3 minutes."
> Text: "Built with OpenClaw 🦞"

---

## 🦞 THE CLAWFATHER'S BLESSING

> "Agents are really, really good at calling CLIs... so you don't have to clutter up your context and you can use all the features on demand."
> 
> — Peter Steinberger (@steipete)

**We're building exactly that. And recording it. And sharing it.**

---

## 📝 NOTES

**What makes this compelling:**
1. **Real-time build** — Not scripted, authentic
2. **Agent does work** — Thaby just gives instructions
3. **Results in minutes** — Not months
4. **No face needed** — Code speaks for itself
5. **LinkedIn-native** — Format matches platform

**What could go wrong:**
1. ServiceNow instance hibernates → Wake it up first
2. API errors → Debug live (authentic!)
3. Voice fails → Use text overlays
4. Build takes longer → Edit out boring parts

**Mitigation:**
- Test everything before recording
- Have fallback options
- Embrace mistakes (authenticity)

---

## 🚀 READY?

**Total time:** 2 hours
**Output:** LinkedIn post with clip + article
**Impact:** Positions Thaby as agentic builder
**Differentiation:** "My agent built this"

**Let's execute.** 🦞💛

---

**Status:** Plan complete. Ready to build.

**Next step:** Start Phase 1 (Preparation)

**Clawfather approval:** 🦞🦞🦞
