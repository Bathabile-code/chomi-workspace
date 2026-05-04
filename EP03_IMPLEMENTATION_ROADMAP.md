# EP03 Implementation Roadmap — Mission Control Dashboard
**Version:** 1.0  
**Date:** May 4, 2026  
**Status:** Ready for execution  

---

## OVERVIEW

This roadmap outlines the step-by-step implementation of the Mission Control Dashboard for EP03. It's designed to be executed in parallel with EP02 improvements.

---

## PHASE 1: SETUP & DESIGN (1 Day)

### 1.1 Project Initialization

**Task:** Create Next.js project structure

```bash
# Create project
cd /home/chomi/ChomiVaultSetup
npx create-next-app@latest mission-control --typescript --tailwind --eslint

# Install dependencies
cd mission-control
npm install framer-motion recharts socket.io-client

# Create directory structure
mkdir -p pages/api components lib utils public
```

**Deliverable:** Working Next.js project with Tailwind CSS

### 1.2 Design Finalization

**Task:** Create wireframes and design system

**Wireframes to create:**
1. Dashboard layout (4-column grid)
2. Agent Monitor component
3. Bridge Monitor component
4. Email Timeline component
5. Case Creation Feed component
6. Progress Bar component

**Design System:**
- Color palette (slate-900, blue-500, green-500, etc.)
- Typography (Inter, Fira Code)
- Spacing scale (4px, 8px, 12px, 16px, 24px)
- Component library (buttons, cards, badges)

**Tools:** Figma (free tier) or Excalidraw

**Deliverable:** Design system document + wireframes

---

## PHASE 2: BACKEND API ROUTES (1 Day)

### 2.1 Create API Routes

**Files to create:**

#### `pages/api/agents.ts`
```typescript
// Returns list of OpenClaw agents
// Data source: ~/.openclaw/workspace/sessions/
// Response: { agents: Agent[], total: number, executing: number }
```

**Implementation:**
- Read session files from disk
- Parse agent status
- Calculate progress percentage
- Return JSON

**Testing:**
```bash
curl http://localhost:3000/api/agents
```

#### `pages/api/bridge-status.ts`
```typescript
// Returns Bridge MCP status and metrics
// Data source: /home/chomi/ChomiVaultSetup/bridge-mcp/processed_emails.json
// Response: { status, last_sync, metrics, config }
```

**Implementation:**
- Read processed_emails.json
- Count ingested/skipped/errors
- Calculate dedup rate
- Return JSON

**Testing:**
```bash
curl http://localhost:3000/api/bridge-status
```

#### `pages/api/emails.ts`
```typescript
// Returns list of processed emails
// Data source: Bridge MCP + SendClaw API
// Response: { emails: Email[], total: number }
```

**Implementation:**
- Read processed_emails.json
- Fetch email details from SendClaw API
- Map to Email interface
- Return JSON

**Testing:**
```bash
curl http://localhost:3000/api/emails
```

#### `pages/api/cases.ts`
```typescript
// Returns list of ServiceNow cases
// Data source: ServiceNow REST API
// Response: { cases: Case[], total: number }
```

**Implementation:**
- Query ServiceNow /api/now/table/sn_customerservice_case
- Filter by created_at (last 24 hours)
- Map to Case interface
- Return JSON

**Testing:**
```bash
curl http://localhost:3000/api/cases
```

#### `pages/api/stream.ts` (Optional)
```typescript
// Server-Sent Events stream for real-time updates
// Sends updated metrics every 5 seconds
```

**Implementation:**
- Set SSE headers
- Poll all data sources every 5s
- Send JSON events
- Handle client disconnect

**Testing:**
```bash
curl http://localhost:3000/api/stream
```

**Deliverable:** All API routes working and tested

### 2.2 Environment Configuration

**File:** `.env.local`

```bash
# ServiceNow
SERVICENOW_INSTANCE=https://dev228466.service-now.com
SERVICENOW_USERNAME=admin
SERVICENOW_PASSWORD=yb*qaLD/T26X

# SendClaw
SENDCLAW_API_KEY=mk_your_key_here
SENDCLAW_MAILBOX=chomi_agent@sendclaw.com

# Bridge MCP
BRIDGE_MCP_DIR=/home/chomi/ChomiVaultSetup/bridge-mcp

# OpenClaw
OPENCLAW_WORKSPACE=/home/chomi/.openclaw/workspace
```

**Deliverable:** `.env.local` configured and tested

---

## PHASE 3: FRONTEND COMPONENTS (1.5 Days)

### 3.1 Create React Components

**File Structure:**
```
components/
├── AgentMonitor.tsx
├── BridgeMonitor.tsx
├── EmailTimeline.tsx
├── CaseCreationFeed.tsx
├── ProgressBar.tsx
└── Dashboard.tsx (main component)
```

#### AgentMonitor.tsx

**Features:**
- Display list of agents
- Show status (spawning, executing, completed, error)
- Animate progress bar
- Slide-in animation for new agents

**Code:**
```typescript
import React, { useEffect, useState } from "react";
import { motion } from "framer-motion";

interface Agent {
  id: string;
  name: string;
  status: "spawning" | "executing" | "completed" | "error";
  started_at: string;
  progress: number;
}

export function AgentMonitor() {
  const [agents, setAgents] = useState<Agent[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchAgents = async () => {
      const res = await fetch("/api/agents");
      const data = await res.json();
      setAgents(data.agents);
      setLoading(false);
    };

    fetchAgents();
    const interval = setInterval(fetchAgents, 5000);
    return () => clearInterval(interval);
  }, []);

  const statusColor = {
    spawning: "bg-yellow-500",
    executing: "bg-blue-500",
    completed: "bg-green-500",
    error: "bg-red-500"
  };

  return (
    <div className="bg-slate-900 rounded-lg p-6 text-white">
      <h2 className="text-xl font-bold mb-4">Agents Spawning</h2>
      {loading ? (
        <p className="text-gray-400">Loading...</p>
      ) : (
        <div className="space-y-4">
          {agents.map((agent, idx) => (
            <motion.div
              key={agent.id}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: idx * 0.1 }}
              className="border border-gray-700 rounded p-4"
            >
              <div className="flex items-center justify-between mb-2">
                <span className="font-semibold">{agent.name}</span>
                <span className={`text-sm px-2 py-1 rounded ${statusColor[agent.status]}`}>
                  {agent.status}
                </span>
              </div>
              <div className="w-full bg-gray-700 rounded-full h-2">
                <motion.div
                  className="bg-blue-500 h-2 rounded-full"
                  initial={{ width: 0 }}
                  animate={{ width: `${agent.progress}%` }}
                  transition={{ duration: 0.5 }}
                />
              </div>
              <p className="text-sm text-gray-400 mt-2">
                Started: {new Date(agent.started_at).toLocaleTimeString()}
              </p>
            </motion.div>
          ))}
        </div>
      )}
    </div>
  );
}
```

#### BridgeMonitor.tsx

**Features:**
- Display Bridge MCP status
- Show metrics (checked, ingested, skipped, errors)
- Animate flow arrows
- Update every 5 seconds

**Code:** (Similar structure to AgentMonitor)

#### EmailTimeline.tsx

**Features:**
- Display list of emails
- Show from, subject, timestamp
- Status indicator (processing, ingested, error)
- Slide-in animation for new emails

#### CaseCreationFeed.tsx

**Features:**
- Display list of ServiceNow cases
- Show case number, subject, priority
- Link to ServiceNow instance
- Pop animation for new cases

#### ProgressBar.tsx

**Features:**
- Show overall progress (emails processed / total)
- Display success rate
- Show average processing time

#### Dashboard.tsx

**Features:**
- Main layout component
- Grid layout (2x2 or 4-column)
- Combine all sub-components
- Handle data fetching

**Code:**
```typescript
import React from "react";
import { AgentMonitor } from "./AgentMonitor";
import { BridgeMonitor } from "./BridgeMonitor";
import { EmailTimeline } from "./EmailTimeline";
import { CaseCreationFeed } from "./CaseCreationFeed";
import { ProgressBar } from "./ProgressBar";

export function Dashboard() {
  return (
    <div className="bg-slate-950 min-h-screen p-8">
      <h1 className="text-4xl font-bold text-white mb-8">Mission Control</h1>
      
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
        <AgentMonitor />
        <BridgeMonitor />
      </div>
      
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <EmailTimeline />
        <CaseCreationFeed />
      </div>
      
      <div className="mt-6">
        <ProgressBar />
      </div>
    </div>
  );
}
```

**Deliverable:** All components working with real data

### 3.2 Styling & Animations

**Tailwind Configuration:**
```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        slate: {
          950: "#030712",
          900: "#0f172a"
        }
      },
      animation: {
        "slide-in": "slideIn 0.3s ease-out",
        "pulse-slow": "pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite"
      },
      keyframes: {
        slideIn: {
          "0%": { opacity: "0", transform: "translateX(-20px)" },
          "100%": { opacity: "1", transform: "translateX(0)" }
        }
      }
    }
  }
};
```

**Deliverable:** Styled components with smooth animations

---

## PHASE 4: TESTING & OPTIMIZATION (0.5 Days)

### 4.1 Unit Tests

**Test files:**
- `__tests__/api/agents.test.ts`
- `__tests__/api/bridge-status.test.ts`
- `__tests__/components/AgentMonitor.test.tsx`

**Testing framework:** Jest + React Testing Library

```bash
npm install --save-dev jest @testing-library/react @testing-library/jest-dom
```

### 4.2 Performance Testing

**Metrics to measure:**
- Page load time (target: < 1s)
- API response time (target: < 500ms)
- Component render time (target: < 100ms)
- Animation frame rate (target: 60 FPS)

**Tools:** Lighthouse, React DevTools Profiler

### 4.3 Browser Testing

**Browsers to test:**
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Mobile (iPhone, Android)

**Deliverable:** All tests passing, performance metrics met

---

## PHASE 5: DEPLOYMENT (0.5 Days)

### 5.1 Vercel Deployment

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel

# Set environment variables
vercel env add SERVICENOW_INSTANCE
vercel env add SERVICENOW_USERNAME
vercel env add SERVICENOW_PASSWORD
vercel env add SENDCLAW_API_KEY
vercel env add SENDCLAW_MAILBOX
vercel env add BRIDGE_MCP_DIR
vercel env add OPENCLAW_WORKSPACE

# Redeploy with env vars
vercel --prod
```

**Deliverable:** Dashboard live at `mission-control.vercel.app`

### 5.2 Custom Domain (Optional)

```bash
# Add custom domain
vercel domains add mission-control.chomi.dev

# Update DNS records
# (Follow Vercel instructions)
```

**Deliverable:** Dashboard accessible at custom domain

---

## PHASE 6: DEMO & RECORDING (1 Day)

### 6.1 Demo Script

**Duration:** 2-3 minutes

**Narrative:**
> "This is the Mission Control Dashboard for Chomi's agentic email-to-case pipeline. Watch as we process a customer email end-to-end."

**Steps:**
1. Show dashboard with all metrics at zero
2. Send test email to `chomi_agent@sendclaw.com`
3. Show agent being spawned
4. Show Bridge MCP detecting email
5. Show email being ingested
6. Show case being created in ServiceNow
7. Show confirmation email being sent

### 6.2 Recording Setup

**OBS Studio Configuration:**
- Scene: 1920x1080 (16:9)
- Source: Browser (http://localhost:3000)
- Bitrate: 6000 kbps
- Framerate: 30 fps

**Recording Steps:**
1. Start dashboard
2. Open OBS Studio
3. Add browser source
4. Start recording
5. Send test email
6. Wait for full pipeline
7. Stop recording

### 6.3 Video Editing

**Software:** DaVinci Resolve (free)

**Editing Steps:**
1. Import recording
2. Trim idle time
3. Speed up waiting periods (2x)
4. Add captions/text overlays
5. Add background music (royalty-free)
6. Export as MP4 (1080p, H.264)

**Deliverable:** Polished 2-3 minute video

---

## PHASE 7: CONTENT & PUBLISHING (0.5 Days)

### 7.1 Blog Post

**File:** `/home/chomi/ChomiVaultSetup/blog/ep03-mission-control-dashboard.md`

**Sections:**
1. Introduction (why visualization matters)
2. Architecture overview (data flow diagram)
3. Component breakdown (each component explained)
4. Tech stack (why Next.js, React, Tailwind)
5. Real-time updates (polling vs WebSocket)
6. Deployment (Vercel setup)
7. Recording guide (OBS Studio)
8. Lessons learned
9. Next steps (EP04 preview)

**Length:** 2000-3000 words

### 7.2 LinkedIn Post

**Format:** Video + caption

**Caption:**
```
🎬 EP03: Mission Control Dashboard for AI Agents

Watch the entire agentic email-to-case pipeline in action:
✅ Agent spawning
✅ MCP Bridge traffic
✅ Email ingestion
✅ Case creation

This is what happens when you combine:
- OpenClaw agents
- ServiceNow REST API
- Real-time visualization
- #BuildInPublic transparency

Built with Next.js + React + Tailwind CSS

Full blog post: [link]
GitHub repo: [link]

#AI #Agents #ServiceNow #BuildInPublic #OpenClaw
```

**Hashtags:**
- #AI
- #Agents
- #ServiceNow
- #BuildInPublic
- #OpenClaw
- #AgenticAI
- #Automation
- #WebDevelopment

### 7.3 GitHub Repository

**Structure:**
```
mission-control/
├── pages/
│   ├── api/
│   │   ├── agents.ts
│   │   ├── bridge-status.ts
│   │   ├── emails.ts
│   │   ├── cases.ts
│   │   └── stream.ts
│   ├── _app.tsx
│   ├── _document.tsx
│   └── index.tsx
├── components/
│   ├── AgentMonitor.tsx
│   ├── BridgeMonitor.tsx
│   ├── EmailTimeline.tsx
│   ├── CaseCreationFeed.tsx
│   ├── ProgressBar.tsx
│   └── Dashboard.tsx
├── lib/
│   ├── types.ts
│   ├── api.ts
│   └── utils.ts
├── styles/
│   └── globals.css
├── public/
│   └── favicon.ico
├── .env.example
├── README.md
├── package.json
├── tsconfig.json
├── tailwind.config.js
└── next.config.js
```

**README.md:**
- Project overview
- Tech stack
- Installation instructions
- Environment setup
- Running locally
- Deployment guide
- API documentation
- Component documentation
- Contributing guidelines

**Deliverable:** GitHub repo with full documentation

---

## TIMELINE SUMMARY

| Phase | Duration | Deliverable |
|---|---|---|
| 1. Setup & Design | 1 day | Next.js project + wireframes |
| 2. Backend API | 1 day | All API routes working |
| 3. Frontend Components | 1.5 days | React components with animations |
| 4. Testing & Optimization | 0.5 days | Tests passing, performance optimized |
| 5. Deployment | 0.5 days | Live on Vercel |
| 6. Demo & Recording | 1 day | Polished 2-3 min video |
| 7. Content & Publishing | 0.5 days | Blog post + LinkedIn post + GitHub |
| **TOTAL** | **~5.5 days** | **Complete EP03** |

---

## RESOURCE REQUIREMENTS

### Team
- **Frontend Developer:** 3 days (components + styling)
- **Backend Developer:** 1 day (API routes)
- **DevOps:** 0.5 days (deployment)
- **Content Creator:** 1 day (video + blog)
- **QA:** 0.5 days (testing)

### Tools
- Next.js (free)
- Vercel (free tier)
- OBS Studio (free)
- DaVinci Resolve (free)
- GitHub (free)

### Infrastructure
- ServiceNow instance (already have)
- SendClaw account (already have)
- Bridge MCP (already have)

---

## SUCCESS CRITERIA

### Technical
- [ ] All API routes return correct data
- [ ] Components render without errors
- [ ] Real-time updates work (5s refresh)
- [ ] Animations are smooth (60 FPS)
- [ ] Page loads in < 1 second
- [ ] Mobile responsive (optional)

### Content
- [ ] Video is 2-3 minutes
- [ ] Captions are clear
- [ ] Call-to-action is compelling
- [ ] Blog post is 2000+ words
- [ ] GitHub repo is well-documented

### Engagement
- [ ] LinkedIn post gets 100+ likes
- [ ] Comments show interest
- [ ] GitHub repo gets stars
- [ ] Blog post gets views

---

## RISK MITIGATION

| Risk | Mitigation |
|---|---|
| API performance issues | Use caching, optimize queries |
| Real-time update lag | Increase polling frequency if needed |
| Video recording quality | Test OBS settings beforehand |
| Deployment issues | Test on staging first |
| Content not resonating | Get feedback from community |

---

## NEXT STEPS

1. **Approve this roadmap** (Thuluzi)
2. **Assign team members** (Thaby)
3. **Start Phase 1** (Setup & Design)
4. **Daily standups** (15 min sync)
5. **Publish by May 11, 2026** (Target date)

---

**Ready to build? Let's go! 🚀**

