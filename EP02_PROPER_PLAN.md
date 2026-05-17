# EP02 Demo: Proper MCP Server Implementation Plan

## The Problem
I messed up by:
1. Not recording the demo in real-time
2. Switching from MCP server to direct REST API
3. Not following the agent team workflow properly

## The Solution: Use @aartiq/servicenow-mcp Properly

### What @aartiq/servicenow-mcp Provides:
- **400+ tools** across all ServiceNow modules
- **MCP protocol** - AI agent-native
- **Five-tier permissions** - Read, Write, CMDB, Scripting, Now Assist
- **Multi-instance support** - dev, staging, prod
- **Role-based packages** - service_desk, platform_developer, etc.

### EP02 Workflow (Correct):

**1. 📧 Emails Arrive**
- 3 emails in chomi-ep02@wshu.net (mail.tm)
- Cases: CS0001002 (HIGH), CS0001004 (HIGH), CS0001003 (LOW)

**2. 🔄 Kwazi (Bridge Agent) - INJECT via MCP**
- Use @aartiq/servicenow-mcp tools
- Call `create_record` on `sys_email` table
- Or use email ingestion tools
- **MCP Native** - not REST API

**3. ✅ Thuluzi-QA-1 - VERIFY via MCP**
- Use `get_record` or `query_records` on sys_email
- Verify all 3 records exist with correct data
- **MCP Native** - query through MCP server

**4. 🎯 Lakshmi-RITM - CREATE via MCP**
- Use `create_record` on `sc_req_item` table
- Set priority based on email content
- Link to sys_email via reference field
- **MCP Native** - create through MCP server

**5. ✅ Thuluzi-QA-2 - VERIFY via MCP**
- Query RITMs through MCP
- Verify priorities, linkages
- **MCP Native** - verify through MCP server

**6. 🔍 Thuluzi-Auditor - END-TO-END via MCP**
- Query both sys_email and sc_req_item
- Cross-reference and verify
- **MCP Native** - audit through MCP server

### Recording Setup:
**Option A: Browser Harness + OBS**
- Browser Harness navigates ServiceNow
- OBS records the screen
- Shows real-time MCP tool calls

**Option B: Terminal Recording**
- Record terminal showing MCP server logs
- Show each tool call and response
- ffmpeg or asciinema

**Option C: Hybrid**
- Terminal: MCP tool calls
- Browser: ServiceNow UI proof
- Picture-in-picture recording

### Implementation Steps:

1. **Start MCP Server**
   ```bash
   cd ~/ChomiVaultSetup/bridge-mcp
   export SERVICENOW_INSTANCE_URL="https://dev228466.service-now.com"
   export SERVICENOW_AUTH_METHOD="basic"
   export SERVICENOW_BASIC_USERNAME="admin"
   export SERVICENOW_BASIC_PASSWORD="yb*qaLD/T26X"
   export WRITE_ENABLED="true"
   npx @aartiq/servicenow-mcp
   ```

2. **Spawn Agent Team**
   - Kwazi-Bridge: Uses MCP tools to inject
   - Thuluzi-QA-1: Uses MCP tools to verify
   - Lakshmi-RITM: Uses MCP tools to create
   - Thuluzi-QA-2: Uses MCP tools to verify
   - Thuluzi-Auditor: Uses MCP tools to audit

3. **Record Everything**
   - Start recording BEFORE spawning agents
   - Capture terminal output
   - Capture Browser Harness screenshots
   - Compile into video

### Why This Is Better:
- **MCP Native** - shows real agentic AI
- **400+ tools** - comprehensive ServiceNow coverage
- **Production-ready** - not hacked together
- **Scalable** - works with any MCP client
- **Proper delegation** - each agent uses MCP tools

### Next Steps:
1. Reset ServiceNow instance (clean state)
2. Start MCP server
3. Start recording
4. Spawn agent team with MCP tools
5. Record end-to-end
6. Compile video

This is the RIGHT way to do EP02. 💛

---

## Recording Research: Open Source Alternatives to OBS

### **1. SimpleScreenRecorder** ⭐ (Best Option)
- **Features:** X11/OpenGL recording, audio, configurable FPS
- **Pros:** Lightweight, stable, good quality
- **Cons:** Needs X11 display
- **Install:** `sudo apt-get install simplescreenrecorder`

### **2. asciinema** (Terminal Only)
- **Features:** Text-based terminal recording, shareable
- **Pros:** Lightweight, searchable, embeddable
- **Cons:** No GUI/browser capture
- **Install:** `sudo apt-get install asciinema`

### **3. peek** (GIF Recorder)
- **Features:** Simple GIF screen capture
- **Pros:** Easy to use, small files
- **Cons:** GIF only, limited duration
- **Install:** `sudo apt-get install peek`

### **4. byzanz** (Small Screencasts)
- **Features:** Command-line recorder, GIF/OGV
- **Pros:** Scriptable, lightweight
- **Cons:** Basic features
- **Install:** `sudo apt-get install byzanz`

### **5. wf-recorder** (Wayland)
- **Features:** Wayland compositor recording
- **Pros:** Native Wayland support
- **Cons:** WSL2 might not support Wayland

### **6. ffmpeg + Xvfb** (Headless)
- **Features:** Full control, any format
- **Pros:** Flexible, scriptable
- **Cons:** Complex setup
- **Command:** `ffmpeg -f x11grab -i :99 -r 30 output.mp4`

### **My Recommendation for EP02:**

**Option A: SimpleScreenRecorder** (if we can install it)
- Best balance of features and simplicity
- Records both terminal and browser
- Good quality output

**Option B: ffmpeg + Xvfb** (fallback)
- Already have ffmpeg installed
- Just need to set up virtual display
- More complex but works

**Option C: asciinema + Screenshots** (hybrid)
- Record terminal with asciinema
- Browser Harness for UI screenshots
- Combine into presentation

### **What I Need From You:**

1. **Can you run:** `sudo apt-get install simplescreenrecorder`?
2. **Or should I use:** ffmpeg + Xvfb (already have ffmpeg)?
3. **Or prefer:** asciinema + screenshot hybrid?

Tell me which route and I'll set it up! 💛