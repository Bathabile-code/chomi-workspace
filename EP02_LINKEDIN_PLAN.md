# 🎬 EP02: LinkedIn-First Build Capture

**Platform:** LinkedIn (not YouTube)
**Format:** No face, text + screen recordings + voiceover
**Output:** Clip + lengthy article
**Who does the work:** Chomi + agents

---

## 🎯 The New Plan

### **What Thaby Wants**
1. ✅ LinkedIn post (not video platform)
2. ✅ No face on camera
3. ✅ Chomi does the build
4. ✅ Agents handle recording/capture
5. ✅ Output: Short clip + lengthy article

### **What This Means**
- **Not a 20-min video** — It's a LinkedIn post
- **Not face-to-camera** — Screen recordings + voice/text
- **Chomi builds** — Thaby watches/approves
- **Agents capture** — Automated recording of the build
- **Final output:** 1-2 min clip + detailed article

---

## 🏗️ Revised Approach

### **Phase 1: Build (Chomi does this)**
```
Chomi builds Chomi 2.0:
├── Real ServiceNow integration (MCP)
├── Demo layer (CLI)
├── Voice integration (ElevenLabs)
└── Test everything
```
**Output:** Working system

### **Phase 2: Capture (Agents do this)**
```
Spawn agents:
├── Screen recorder agent → Captures build process
├── Clip editor agent → Creates 1-2 min highlight
├── Article writer agent → Writes LinkedIn article
└── Thuluzi (review) → Reviews everything
```
**Output:** Clip + article

### **Phase 3: Publish (Thaby does this)**
```
Thaby:
├── Reviews clip and article
├── Approves or requests changes
├── Posts on LinkedIn
└── Engages with comments
```
**Output:** Live LinkedIn post

---

## 🎥 Capture Strategy

### **Option A: Terminal Recording (Simple)**
- Record terminal output during build
- Use `script` command or `asciinema`
- Convert to GIF or short video
- **Pros:** Simple, authentic, no setup
- **Cons:** No voice, just text

### **Option B: Screen Recording (Better)**
- Use `ffmpeg` to capture screen
- Record terminal + browser
- Add voiceover later (ElevenLabs)
- **Pros:** Visual, professional
- **Cons:** More setup

### **Option C: Automated Capture (Advanced)**
- Agent captures screenshots at key moments
- Records commands and outputs
- Auto-generates clip from highlights
- **Pros:** Automated, scalable
- **Cons:** Complex to build

**Recommendation:** Start with Option A (terminal recording), upgrade to B if needed.

---

## 📝 Article Structure

### **LinkedIn Article Format**

**Title:** "I Built an AI Agent That Integrates Email with ServiceNow in 20 Minutes"

**Hook (Paragraph 1):**
> "Every day, support teams waste hours copying emails into ServiceNow. Manual data entry. Context switching. It's 2026. Why are we still doing this?"

**The Build (Paragraphs 2-5):**
> "I gave my AI agent (Chomi) a simple task: 'Connect my email to ServiceNow.'"
>
> "Here's what happened:"
> - She asked for credentials
> - She analyzed the ServiceNow UI
> - She orchestrated a 4-step workflow
> - She integrated 20 emails with zero duplicates
> - She learned from the process

**The Tech (Paragraphs 6-8):**
> "Built with OpenClaw. Hybrid approach:"
> - CLI layer for speed and visualization
> - MCP layer for production reliability
> - ElevenLabs for voice interaction
> - Peekaboo for visual intelligence

**The Result (Paragraph 9):**
> "20 minutes. Working integration. Zero manual work."

**Call to Action (Paragraph 10):**
> "This is the future of agentic development. Not months. Minutes."
>
> "What would you build if you had an agent that could do this?"

---

## 🎬 Clip Structure (1-2 Minutes)

### **The Highlight Reel**

**Scene 1: The Ask (10 seconds)**
- Text: "Connect my email to ServiceNow"
- Chomi responds: "I need credentials..."
- Voice: ElevenLabs

**Scene 2: The Build (30 seconds)**
- Terminal: Real code being written
- Fast-forward through typing
- Key moments: API calls, responses

**Scene 3: The Result (20 seconds)**
- ServiceNow table with 20 emails
- Text: "20 emails. 0 duplicates. 3 minutes."
- Chomi voice: "Done."

**Scene 4: The Reflection (20 seconds)**
- Chomi reflects on what worked
- Updates rules
- Text: "Next time will be faster"

**Outro (10 seconds)**
- Text: "Built with OpenClaw. The future is here. 🦞"

---

## 🤖 Agent Tasks

### **Agent 1: Builder (Chomi)**
**Task:** Build Chomi 2.0
**Output:** Working system

### **Agent 2: Recorder**
**Task:** Capture the build process
**Tools:**
- `asciinema` (terminal recording)
- `ffmpeg` (screen capture)
- Screenshots at key moments
**Output:** Raw footage

### **Agent 3: Clip Editor**
**Task:** Create 1-2 min highlight
**Tools:**
- `ffmpeg` (video editing)
- Text overlays
- Speed up boring parts
**Output:** Final clip

### **Agent 4: Article Writer**
**Task:** Write LinkedIn article
**Tools:**
- `human-writing` skill
- `de-ai-ify` skill
**Output:** Article draft

### **Agent 5: Reviewer (Thuluzi)**
**Task:** Review clip + article
**Output:** Approval or feedback

---

## 📋 Execution Plan

### **Step 1: Build (30 minutes)**
```bash
# Chomi builds the system
./build-chomi-2-0.sh

# Test everything
./test-chomi-2-0.sh
```

### **Step 2: Capture (15 minutes)**
```bash
# Start recording
asciinema rec build.cast

# Run the demo
./chomi-demo.sh

# Stop recording
exit

# Convert to GIF/video
asciinema convert build.cast build.gif
```

### **Step 3: Create Clip (15 minutes)**
```bash
# Edit highlights
ffmpeg -i build.cast -ss 00:01:00 -t 00:02:00 -c copy highlight.mp4

# Add text overlays
ffmpeg -i highlight.mp4 -vf "drawtext=text='20 emails ingested':x=10:y=10" final.mp4
```

### **Step 4: Write Article (20 minutes)**
```bash
# Generate article
chomi-write-article --topic "Agentic ServiceNow Integration" --style linkedin
```

### **Step 5: Review (10 minutes)**
```bash
# Thuluzi reviews
thuluzi-review --clip final.mp4 --article article.md
```

### **Step 6: Publish (5 minutes)**
```bash
# Thaby posts on LinkedIn
linkedin-post --clip final.mp4 --article article.md
```

**Total Time:** ~1.5 hours

---

## 🎯 Success Criteria

### **For the Clip**
- ✅ 1-2 minutes
- ✅ Shows the build process
- ✅ Highlights key moments
- ✅ No face required
- ✅ Professional enough for LinkedIn

### **For the Article**
- ✅ 800-1200 words
- ✅ Technical but accessible
- ✅ Shows the process
- ✅ Includes results
- ✅ Call to action

### **For the Post**
- ✅ Engaging hook
- ✅ Clear value proposition
- ✅ Visual element (clip)
- ✅ Discussion starter

---

## 🚀 Next Steps

1. **Confirm approach** — Does this match what Thaby wants?
2. **Start build** — Chomi builds the system
3. **Capture process** — Record the build
4. **Create assets** — Clip + article
5. **Review** — Thuluzi checks quality
6. **Publish** — Thaby posts on LinkedIn

---

## 💡 The Vision

**This is not just a demo. This is a new way of building content.**

- Agents build the system
- Agents capture the process
- Agents create the content
- Human reviews and publishes

**The future of #BuildInPublic is agent-assisted.** 🦞

---

**Ready to execute?** 🚀

**Estimated time:** 1.5 hours
**Output:** LinkedIn post with clip + article
**Clawfather approval:** 🦞🦞🦞

**Let's build the future.** 💛
