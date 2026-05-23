# 🎬 EP02: "Build With Me" — Recording Plan

**Concept:** Record the actual build process as the episode content. Not a polished demo, but a real "watch us build this" session.

**Format:** Screen recording + voiceover (or live commentary)
**Duration:** 15-20 minutes
**Style:** Authentic, unpolished, real development

---

## 🎯 The Narrative Arc

### **Hook (0:00-1:00)**
**Thaby (voiceover):**
> "Last episode, I showed you the vision. Today, I'm going to show you how we actually build it. No scripts, no rehearsals — just real agentic development in real-time."

**Visual:** Terminal open, code editor ready

---

## 🏗️ Phase 1: Setup & Architecture (1:00-5:00)

### **What happens:**
1. **Show the workspace**
   - Open terminal
   - Show directory structure
   - Explain the hybrid approach (CLI + MCP)

2. **Set up the foundation**
   ```bash
   mkdir -p ~/.openclaw/agents/chomi-2-0/{real,demo,shared}
   ```

3. **Explain the architecture**
   - Real layer (MCP) → Production integration
   - Demo layer (CLI) → Visual showcase
   - Why both? → Best of both worlds

**Thaby commentary:**
> "So here's the thing — Kwazi said use both. CLI for the demo, MCP for real integration. I like that. Let's build it."

**Visual:** 
- Split screen: Terminal + Architecture diagram (text-based)
- Real-time code writing

---

## 🔧 Phase 2: Build Real Integration (5:00-10:00)

### **What happens:**
1. **Create ServiceNow MCP**
   ```javascript
   // servicenow-mcp.js
   class ServiceNowMCP {
     constructor() {
       this.baseUrl = `https://${process.env.SERVICENOW_INSTANCE}.service-now.com`;
     }
     
     async getEmails(limit = 10) {
       // Real REST API call
     }
     
     async createEmail(subject, body, from) {
       // Real record creation
     }
     
     async checkDuplicate(subject, from) {
       // Real deduplication
     }
   }
   ```

2. **Test the integration**
   ```bash
   export SERVICENOW_INSTANCE="dev228466"
   export SERVICENOW_USER="admin"
   export SERVICENOW_PASSWORD="***"
   
   node -e "const {ServiceNowMCP} = require('./servicenow-mcp'); 
   const mcp = new ServiceNowMCP(); 
   mcp.getEmails(5).then(console.log)"
   ```

3. **Show real data flowing**
   - Terminal shows actual API response
   - JSON data from ServiceNow
   - Real sys_email records

**Thaby commentary:**
> "This is the real deal. Not simulated data. Actual ServiceNow REST API calls. See? Here's the response."

**Visual:**
- Terminal showing code being written
- Real API responses
- JSON data formatted nicely

---

## 🎨 Phase 3: Build Demo Layer (10:00-15:00)

### **What happens:**
1. **Create the demo script**
   ```bash
   # chomi-demo.sh
   # 5-act structure
   
   act1_ask() {
     echo "🎙️ Chomi: 'I need credentials...'"
     chomi-demo-voice ask
   }
   
   act2_see() {
     echo "📸 Taking screenshot..."
     chomi-screenshot /tmp/servicenow.png
   }
   
   act3_orchestrate() {
     echo "🔀 Running pipeline..."
     chomi-pipeline "email-to-servicenow" "setup,bridge,test,show"
   }
   ```

2. **Add voice integration**
   ```bash
   # Test ElevenLabs
   curl -X POST https://api.elevenlabs.io/v1/text-to-speech/... \
     -d '{"text":"Hello, I am Chomi 2.0"}' \
     -o /tmp/chomi-voice.mp3
   
   # Play it
   ffplay /tmp/chomi-voice.mp3
   ```

3. **Test the demo**
   ```bash
   ./chomi-demo.sh
   ```

**Thaby commentary:**
> "Now the fun part. Let's make Chomi speak. ElevenLabs API. Jessica voice. Let's test it."

**Visual:**
- Terminal showing demo script being built
- Voice generation in real-time
- Audio playback

---

## 🧪 Phase 4: Integration & Testing (15:00-18:00)

### **What happens:**
1. **Wire real + demo together**
   ```bash
   # Demo script uses real MCP when available
   if [ -f "real/servicenow-mcp.js" ]; then
     # Use real data
     node -e "const {ServiceNowMCP} = require('./real/servicenow-mcp'); ..."
   else
     # Fall back to simulated
     echo "Using simulated data"
   fi
   ```

2. **Run end-to-end test**
   ```bash
   ./chomi-demo.sh
   ```
   
   **Expected output:**
   - Voice asks for credentials
   - Screenshot taken
   - Pipeline runs with approval gates
   - Real data from ServiceNow (or simulated if no creds)
   - Voice announces results

3. **Debug if needed**
   - Real debugging (not scripted)
   - Fix errors on the fly
   - Show problem-solving

**Thaby commentary:**
> "Let's see if it works. Oh, error. Let me fix that. This is real development — not everything works first time."

**Visual:**
- Terminal showing real output
- Debugging in real-time
- Problem-solving

---

## 🎉 Phase 5: Results & Reflection (18:00-20:00)

### **What happens:**
1. **Show the working system**
   - Demo runs successfully
   - Voice works
   - Screenshots work
   - Pipeline works

2. **Show the real data**
   - ServiceNow sys_email table with records
   - Proof that it's real integration

3. **Reflect on the process**
   **Thaby:**
   > "So that's it. We built a real ServiceNow integration AND a demo layer in... what, 20 minutes? This is the power of agentic development."

4. **Call to action**
   **Thaby:**
   > "Next episode, we'll deploy this to production. But for now — this is what the future looks like. Building with agents."

**Visual:**
- Working demo running
- Real ServiceNow data
- Final summary

---

## 🎥 Recording Setup

### **Hardware**
- **Screen:** Single monitor (terminal + code editor)
- **Audio:** Microphone for Thaby's commentary
- **Optional:** Second monitor for reference

### **Software**
- **Recording:** OBS Studio (free)
- **Resolution:** 1920x1080
- **Frame rate:** 30fps

### **Terminal Setup**
- **Font:** Large (14-16pt) for readability
- **Theme:** Dark (Dracula or Monokai)
- **Layout:** Fullscreen terminal

### **Editor Setup**
- **VS Code:** With OpenClaw project
- **Font:** JetBrains Mono or Fira Code
- **Zoom:** 110% for readability

---

## 📝 Script (Loose Guide)

### **Intro (0:00-1:00)**
```
"Last episode, vision. Today, we build. 
No scripts, no rehearsals. Real agentic development."
```

### **Architecture (1:00-5:00)**
```
"Kwazi said use both. CLI for demo, MCP for real. 
Let's set up the workspace."
```

### **Build Real (5:00-10:00)**
```
"ServiceNow MCP. Real REST API calls. 
Let's write the code. Test it. See real data."
```

### **Build Demo (10:00-15:00)**
```
"Now the fun part. Chomi needs a voice. 
ElevenLabs. Let's make her speak."
```

### **Integrate (15:00-18:00)**
```
"Wire them together. Test end-to-end. 
Debug if needed. This is real dev."
```

### **Results (18:00-20:00)**
```
"It works. Real integration + demo layer. 
20 minutes. This is the future."
```

---

## 🎯 Success Metrics

### **For the Episode**
- ✅ Shows real development (not scripted)
- ✅ Working system at the end
- ✅ Voice integration works
- ✅ ServiceNow integration works
- ✅ Viewers can follow along
- ✅ Authentic, not polished

### **For the Build**
- ✅ Real MCP integration built
- ✅ Demo layer built
- ✅ Voice working
- ✅ End-to-end test passing
- ✅ Ready for production

---

## 🚀 Next Steps

1. **Prepare environment**
   - Open terminal
   - Open code editor
   - Set up OBS

2. **Start recording**
   - Hit record
   - Follow the plan
   - Be authentic

3. **Edit (minimal)**
   - Trim silence
   - Add intro/outro text
   - Export

4. **Publish**
   - YouTube
   - X/Twitter
   - Discord

---

## 💡 The Philosophy

**This episode is about:**
- Real development, not polished demos
- Agentic workflows in practice
- Building fast with AI assistance
- Showing the process, not just the result

**The message:**
> "This is how we actually build. Not in weeks. In minutes. With agents."

---

**Ready to record?** 🎬

**Estimated time:** 20 minutes build + 30 minutes edit = 50 minutes total

**Clawfather approval:** 🦞🦞🦞

**Let's build the future.** 💛
