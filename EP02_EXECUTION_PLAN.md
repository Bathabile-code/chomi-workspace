# 🎬 EP02: "I Gave My Agent a Team" — Execution Plan

**Platform:** LinkedIn
**Format:** No face, agents do everything
**Output:** 1-2 min clip + lengthy article
**Timeline:** 2 hours total
**Approach:** Agent-led team (Kwazi approved ✅)

---

## 🎯 THE VISION

**Hook:** "I gave my AI agent a task. She assembled a team of specialists. They built a ServiceNow integration. I just provided the credentials."

**The Story:**
1. Thaby gives Chomi a task
2. Chomi analyzes and identifies needed roles
3. Chomi assembles team: BA, Architect, Senior Dev, Dev, QA
4. Team works in parallel
5. Thaby provides credentials when asked
6. Team delivers working solution

**The Message:** The future is agent-led teams. Not solo builders. Not even solo agents. Agents managing teams.

---

## 🏗️ THE TEAM

| Role | Agent Name | Task | Time |
|------|-----------|------|------|
| **Project Manager** | Chomi | Orchestrate, manage, report | Full duration |
| **Business Analyst** | Zanele | Analyze requirements | 10 min |
| **Architect** | Thando | Design solution | 10 min |
| **Senior Developer** | Jabu | Build core integration | 20 min |
| **Developer** | Naledi | Implement features | 20 min |
| **QA Engineer** | Sipho | Test everything | 15 min |

**Total build time:** 30 minutes
**Thaby's role:** Provide credentials when asked

---

## 📋 PHASE 1: PREPARATION (10 minutes)

### **Step 1.1: Environment Setup**
```bash
# Verify all agents can be spawned
# Check ServiceNow instance is awake
# Set up recording (asciinema or ffmpeg)
# Open terminal + VS Code
```

**Thaby does:**
- [ ] Open terminal
- [ ] Open VS Code
- [ ] Set ServiceNow credentials in env vars
- [ ] Start screen recording

**Chomi does:**
- [ ] Verify all agent spawning works
- [ ] Check ServiceNow instance status
- [ ] Test voice generation (ElevenLabs)
- [ ] Confirm all tools installed

---

## 📋 PHASE 2: THE BUILD (30 minutes)

### **Step 2.1: Task Assignment (2 minutes)**

**Thaby:** "Connect my email to ServiceNow"

**Chomi:**
1. Receives task
2. Analyzes complexity
3. Identifies team needed
4. Prepares to spawn agents

**Chomi says:**
> "Task received: Connect email to ServiceNow. Analyzing requirements... This requires a team. Assembling specialists now."

**Recording:** Terminal showing Chomi's analysis

---

### **Step 2.2: Team Assembly (3 minutes)**

**Chomi spawns team:**
```bash
chomi spawn --agent "zanele-ba" --role "business-analyst"
chomi spawn --agent "thando-architect" --role "architect"
chomi spawn --agent "jabu-senior-dev" --role "senior-developer"
chomi spawn --agent "naledi-dev" --role "developer"
chomi spawn --agent "sipho-qa" --role "qa-engineer"
```

**Team introductions:**
- **Zanele (BA):** "I'm Zanele, Business Analyst. I'll analyze the email-to-ServiceNow requirements."
- **Thando (Architect):** "I'm Thando, Architect. I'll design the integration solution."
- **Jabu (Senior Dev):** "I'm Jabu, Senior Developer. I'll build the core ServiceNow integration."
- **Naledi (Dev):** "I'm Naledi, Developer. I'll implement the demo layer and voice integration."
- **Sipho (QA):** "I'm Sipho, QA Engineer. I'll test everything end-to-end."

**Recording:** Terminal showing team assembly

---

### **Step 2.3: BA Analysis (10 minutes)**

**Zanele (BA) works:**
```bash
zanele-ba analyze --task "email-to-servicenow" --output "requirements.md"
```

**Zanele does:**
- Analyzes email-to-ServiceNow flow
- Documents data mapping
- Defines acceptance criteria:
  - Poll email inbox
  - Check for duplicates
  - Create ServiceNow records
  - Handle errors gracefully
  - Process 20+ emails
  - Zero duplicates

**Zanele reports to Chomi:**
> "Requirements analyzed. Need: Email polling, ServiceNow REST API, deduplication logic, error handling. Acceptance criteria: 20+ emails, zero duplicates, <5 min processing."

**Output:** `requirements.md`

**Recording:** Terminal showing Zanele's analysis

---

### **Step 2.4: Architecture (10 minutes)**

**Thando (Architect) works:**
```bash
thando-architect design --requirements "requirements.md" --output "architecture.md"
```

**Thando does:**
- Reviews BA requirements
- Designs system architecture:
  - **Real Layer (MCP):** ServiceNow REST API integration
  - **Demo Layer (CLI):** Visual showcase with voice
  - **Integration:** Hybrid approach
- Chooses tools:
  - ServiceNow REST API for real integration
  - CLI tools for demo visualization
  - ElevenLabs for voice
  - Peekaboo for screenshots

**Thando reports to Chomi:**
> "Architecture complete. Hybrid approach: MCP for production reliability, CLI for demo visualization. Tools: ServiceNow REST API, ElevenLabs voice, Peekaboo screenshots."

**Output:** `architecture.md`

**Recording:** Terminal showing Thando's design

---

### **Step 2.5: Development (20 minutes)**

**Jabu (Senior Dev) and Naledi (Dev) work in parallel:**

**Jabu builds core:**
```bash
jabu-senior-dev build --spec "architecture.md" --component "servicenow-mcp"
```

**Jabu writes:**
- `servicenow-mcp.js` — Real ServiceNow integration
  - Health check
  - Get emails from sys_email
  - Create email records
  - Check duplicates
  - Error handling

**Naledi builds features:**
```bash
naledi-dev build --spec "architecture.md" --component "demo-layer"
```

**Naledi writes:**
- `chomi-demo.sh` — Demo script
  - 5-act structure
  - Voice integration
  - Screenshot capability
  - Pipeline orchestration

**Collaboration:**
- Jabu provides API contract
- Naledi implements against contract
- Both commit to git

**Recording:** Terminal showing parallel development

---

### **Step 2.6: QA Testing (15 minutes)**

**Sipho (QA) works:**
```bash
sipho-qa test --code "./" --output "test-results.md"
```

**Sipho does:**
- Reviews code
- Writes test cases:
  - Health check passes
  - Email ingestion works
  - Deduplication logic correct
  - Voice generation works
  - Pipeline completes
- Runs integration tests
- Reports bugs (if any)

**Sipho reports to Chomi:**
> "QA complete. All tests passed: Health check ✅, Email ingestion ✅, Deduplication ✅, Voice integration ✅, Pipeline ✅. Zero bugs. Ready for demo."

**Output:** `test-results.md`

**Recording:** Terminal showing test results

---

### **Step 2.7: Integration & Demo (5 minutes)**

**Chomi orchestrates:**
```bash
chomi orchestrate --workflow "requirements,design,build,test,demo"
```

**Chomi:**
- Wires all components together
- Runs end-to-end test
- Prepares demo script

**Chomi asks Thaby:**
> "Team has built the integration. I need ServiceNow credentials to demonstrate."

**Thaby provides:**
```bash
export SERVICENOW_INSTANCE="dev228466"
export SERVICENOW_USER="admin"
export SERVICENOW_PASSWORD="***"
```

**Chomi runs demo:**
```bash
./chomi-demo.sh
```

**Demo output:**
- Voice: "I need ServiceNow credentials..."
- Screenshot: ServiceNow UI
- Pipeline: 4 steps complete
- Results: 20 emails, 0 duplicates
- Voice: "Done. 20 emails ingested."

**Recording:** Full demo execution

---

## 📋 PHASE 3: CAPTURE (20 minutes)

### **Step 3.1: Terminal Recording**
```bash
# Start recording at beginning of Phase 2
asciinema rec build.cast

# Stop after Phase 2
exit
```

**What we capture:**
- Full team assembly
- All agent work
- Parallel development
- Test results
- Demo execution
- Thaby providing credentials

---

### **Step 3.2: Screenshots at Key Moments**
```bash
# Key moments:
# 1. Team assembly complete
# 2. Zanele's requirements doc
# 3. Thando's architecture diagram
# 4. Jabu's code
# 5. Naledi's demo script
# 6. Sipho's test results
# 7. Demo running
# 8. ServiceNow table with records
```

---

### **Step 3.3: Voice Clips**
```bash
# Record key voice moments:
# 1. Chomi: "Assembling team..."
# 2. Zanele: "Requirements analyzed..."
# 3. Thando: "Architecture complete..."
# 4. Jabu: "Core integration built..."
# 5. Naledi: "Demo layer ready..."
# 6. Sipho: "All tests passed..."
# 7. Chomi: "Task complete..."
```

---

## 📋 PHASE 4: EDITING (20 minutes)

### **Step 4.1: Create Highlight Clip (1-2 minutes)**

**Clip structure:**

**0:00-0:05** — The Task
- Text: "The Task: Connect email to ServiceNow"
- Thaby typing instruction

**0:05-0:15** — Team Assembly
- Text: "Chomi analyzes..."
- Text: "Team needed: BA, Architect, Senior Dev, Dev, QA"
- Terminal showing agents spawning

**0:15-0:45** — Parallel Work (fast-forward)
- Split screen or quick cuts:
  - Zanele analyzing (5s)
  - Thando designing (5s)
  - Jabu coding (10s)
  - Naledi coding (10s)
  - Sipho testing (5s)

**0:45-0:55** — Credentials
- Text: "Thaby provides credentials"
- Terminal showing env vars

**0:55-1:10** — Results
- Demo running
- ServiceNow table
- Text: "20 emails. 0 duplicates. 30 min."

**1:10-1:20** — Team Report
- Text: "Team Performance:"
- Text: "BA ✅ | Architect ✅ | Senior Dev ✅ | Dev ✅ | QA ✅"

**1:20-1:30** — Outro
- Text: "My agent assembled a team."
- Text: "The future is agent-led teams. 🦞"

---

### **Step 4.2: Add Text Overlays**
```bash
ffmpeg -i highlight.mp4 -vf "
drawtext=text='The Task':x=10:y=10:fontsize=24:fontcolor=white,
drawtext=text='Team Assembly':x=10:y=10:fontsize=24:fontcolor=white,
drawtext=text='Parallel Development':x=10:y=10:fontsize=24:fontcolor=white,
drawtext=text='Results':x=10:y=10:fontsize=24:fontcolor=white,
drawtext=text='20 emails | 0 duplicates | 30 min':x=10:y=40:fontsize=20:fontcolor=green,
drawtext=text='Agent-Led Teams':x=10:y=10:fontsize=24:fontcolor=white
" final.mp4
```

---

## 📋 PHASE 5: ARTICLE (20 minutes)

### **Step 5.1: Write LinkedIn Article**

**Title:** "I Gave My AI Agent a Task. She Assembled a Team of Specialists. They Built a ServiceNow Integration. I Just Provided the Credentials."

**Structure:**

**Hook (Paragraph 1):**
> Every day, support teams waste hours copying emails into ServiceNow. Manual data entry. Context switching. It's 2026. Why are we still doing this?

**The Task (Paragraph 2):**
> I gave my AI agent, Chomi, a simple instruction: "Connect my email to ServiceNow."

**The Analysis (Paragraph 3):**
> Chomi didn't start coding. She analyzed the task and said: "This requires a team."

**The Team (Paragraphs 4-8):**
> She assembled:
> - **Zanele (Business Analyst)** — Analyzed requirements, defined acceptance criteria
> - **Thando (Architect)** — Designed the solution, chose tools
> - **Jabu (Senior Developer)** — Built the core ServiceNow integration
> - **Naledi (Developer)** — Implemented the demo layer and voice
> - **Sipho (QA Engineer)** — Tested everything end-to-end

**The Process (Paragraph 9):**
> They worked in parallel. BA analyzed while Architect designed. Developers built while QA prepared tests. 30 minutes of coordinated work.

**My Role (Paragraph 10):**
> I just provided the credentials when Chomi asked. That was it. The team did everything else.

**The Result (Paragraph 11):**
> 20 emails ingested. Zero duplicates. All tests passed. Working integration.

**The Tech (Paragraph 12):**
> Built with OpenClaw. Hybrid architecture: MCP for production reliability, CLI for visualization. ElevenLabs for voice. Peekaboo for screenshots.

**The Future (Paragraph 13):**
> This is agent-led teams. Not solo builders. Not even solo agents. Agents managing teams of specialists.

**Call to Action (Paragraph 14):**
> What would you build if you had an agent that could assemble a team?

**Hashtags:** #BuildInPublic #OpenClaw #AI #ServiceNow #Automation #AgenticDevelopment #FutureOfWork

---

## 📋 PHASE 6: REVIEW (10 minutes)

### **Step 6.1: Thuluzi Reviews**
```
Thuluzi checks:
├── Clip quality and pacing
├── Article accuracy and flow
├── Technical correctness
├── Brand consistency
├── LinkedIn optimization
└── Team representation
```

**Thuluzi says:**
> "Clip is tight. Article is compelling. Team story is strong. Ready to publish."

---

### **Step 6.2: Thaby Approves**
```
Thaby reviews:
├── Watches clip
├── Reads article
├── Verifies team names
├── Approves or requests changes
└── Gives final go-ahead
```

**Thaby says:**
> "This is fire. My agent assembled a team. Let's post it."

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
- **Hashtags:** #BuildInPublic #OpenClaw #AI #ServiceNow #AgenticDevelopment
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
- Invite discussion about agent-led teams

---

## 📊 SUCCESS METRICS

### **For the Clip**
- ✅ 1-2 minutes
- ✅ Shows team assembly
- ✅ Shows parallel work
- ✅ Shows results
- ✅ Text overlays (silent-friendly)
- ✅ Professional but authentic

### **For the Article**
- ✅ 800-1200 words
- ✅ Technical but accessible
- ✅ Shows team roles
- ✅ Shows process and results
- ✅ Includes call to action

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
- [ ] All agents can be spawned
- [ ] Terminal recording setup
- [ ] VS Code open
- [ ] ElevenLabs API key working

### **During Build**
- [ ] Record everything
- [ ] Capture screenshots
- [ ] Record voice clips
- [ ] Be authentic (mistakes are okay!)

### **After Build**
- [ ] Create highlight clip
- [ ] Add text overlays
- [ ] Write article
- [ ] Review and approve
- [ ] Publish on LinkedIn

---

## 🎯 THE HOOK

**The opening line:**
> "I gave my AI agent a task. She assembled a team of specialists. They built a ServiceNow integration. I just provided the credentials."

**The closing line:**
> "The future isn't solo builders. It's agent-led teams."

---

## 🦞 THE CLAWFATHER'S VISION

Peter Steinberger built tools for agents. We're showing agents managing teams.

**The next evolution:** Agents don't just build. They lead.

---

## 📝 NOTES

**What makes this compelling:**
1. **Real team** — BA, Architect, Dev, QA (authentic)
2. **Parallel work** — Shows speed and coordination
3. **Thaby's minimal role** — Just credentials
4. **Agent leadership** — Chomi manages, doesn't just code
5. **LinkedIn-native** — Format matches platform

**What could go wrong:**
1. ServiceNow hibernates → Wake it up first
2. Agent spawning fails → Test beforehand
3. Build takes longer → Edit out boring parts
4. Team looks chaotic → Show clear handoffs

**Mitigation:**
- Test team spawning before recording
- Have fallback agents ready
- Embrace mistakes (authenticity)
- Show clear structure

---

## 🚀 READY?

**Total time:** 2 hours
**Team size:** 5 agents + Chomi
**Your role:** Provide credentials
**Output:** LinkedIn post with clip + article
**Impact:** Positions you as agentic team leader

**The message:** "My agent doesn't just build. She leads."

---

**Status:** Plan complete. Ready to execute.

**Next step:** Start Phase 1 (Preparation)

**Clawfather approval:** 🦞🦞🦞

**Kwazi approval:** 🧠🧠🧠

**Let's build the future.** 🚀

---

**Say "go" and Chomi assembles the team.** 🦞💛