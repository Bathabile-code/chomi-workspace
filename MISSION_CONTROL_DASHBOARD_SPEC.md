# Mission Control Dashboard — Technical Specification
**Version:** 1.0  
**Date:** May 4, 2026  
**Author:** Lakshmi, ServiceNow Expert  
**Status:** Ready for implementation  

---

## 1. OVERVIEW

The Mission Control Dashboard is a real-time visualization of the agentic email-to-case pipeline. It shows:
- Agent spawning and execution
- MCP Bridge traffic (email flow)
- Email ingestion from SendClaw
- Case creation in ServiceNow

**Purpose:** Create compelling #BuildInPublic content showing the entire agentic architecture in action.

---

## 2. TECH STACK

### Frontend
- **Framework:** Next.js 14 (React 18 + TypeScript)
- **Styling:** Tailwind CSS + custom animations
- **Real-time:** Server-Sent Events (SSE) or polling
- **Visualization:** Framer Motion (animations) + Recharts (charts)
- **UI Components:** Shadcn/ui (optional, for polish)

### Backend
- **Server:** Next.js API routes (Node.js)
- **Data Sources:**
  - OpenClaw session logs (file system)
  - Bridge MCP API (HTTP)
  - ServiceNow REST API (HTTP)
- **Caching:** In-memory (simple) or Redis (production)

### Deployment
- **Dev:** `localhost:3000`
- **Production:** Vercel (free tier)
- **Recording:** OBS Studio

---

## 3. DATA FLOW

```
┌─────────────────────────────────────────────────────────────┐
│                    DATA SOURCES                              │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  OpenClaw Sessions          Bridge MCP              ServiceNow │
│  ~/.openclaw/workspace/     /bridge-mcp/            REST API   │
│  sessions/                  processed_emails.json   /api/now/  │
│                                                               │
└────────────┬────────────────────────┬──────────────────┬─────┘
             │                        │                  │
             ▼                        ▼                  ▼
┌─────────────────────────────────────────────────────────────┐
│              NEXT.JS API ROUTES (Backend)                    │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  /api/agents          → Parse OpenClaw sessions              │
│  /api/bridge-status   → Query Bridge MCP status              │
│  /api/emails          → Get processed emails                 │
│  /api/cases           → Query ServiceNow cases               │
│  /api/stream          → Server-Sent Events (real-time)       │
│                                                               │
└────────────┬────────────────────────────────────────────────┘
             │
             ▼
┌─────────────────────────────────────────────────────────────┐
│              REACT COMPONENTS (Frontend)                     │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  <Dashboard>                                                 │
│    ├─ <AgentMonitor>        (Agent spawning)                │
│    ├─ <BridgeMonitor>       (MCP traffic)                   │
│    ├─ <EmailTimeline>       (Email ingestion)               │
│    ├─ <CaseCreationFeed>    (Case creation)                 │
│    └─ <ProgressBar>         (Overall progress)              │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

---

## 4. COMPONENT SPECIFICATIONS

### 4.1 AgentMonitor Component

**Purpose:** Show OpenClaw agents being spawned and executed.

**Data Structure:**
```typescript
interface Agent {
  id: string;
  name: string;
  status: "spawning" | "executing" | "completed" | "error";
  started_at: string;
  completed_at?: string;
  progress: number; // 0-100
  error?: string;
}
```

**Display:**
```
┌─────────────────────────────────────────┐
│  AGENTS SPAWNING                        │
├─────────────────────────────────────────┤
│                                         │
│  [✓] Chomi (Main Agent)                │
│      Status: Executing                 │
│      Progress: ████████░░░░░░░░░░░░░░ │
│      Started: 08:38 GMT+2              │
│                                         │
│  [✓] Lakshmi (ServiceNow Expert)       │
│      Status: Executing                 │
│      Progress: ██████████████░░░░░░░░░ │
│      Started: 08:38 GMT+2              │
│                                         │
│  [⏳] Kwazi (Builder)                   │
│      Status: Spawning                  │
│      Progress: ██░░░░░░░░░░░░░░░░░░░░ │
│      Started: 08:45 GMT+2              │
│                                         │
└─────────────────────────────────────────┘
```

**Animation:**
- Agents slide in from left when spawned
- Progress bar animates smoothly
- Status changes trigger color transitions
- Completed agents fade to green

### 4.2 BridgeMonitor Component

**Purpose:** Show MCP Bridge traffic and metrics.

**Data Structure:**
```typescript
interface BridgeStatus {
  status: "connected" | "polling" | "idle" | "error";
  last_sync: string;
  metrics: {
    checked: number;
    ingested: number;
    skipped: number;
    errors: number;
    dedup_rate: number; // percentage
  };
  config: {
    sendclaw_mailbox: string;
    servicenow_instance: string;
    poll_interval: number; // seconds
  };
}
```

**Display:**
```
┌─────────────────────────────────────────┐
│  MCP BRIDGE TRAFFIC                     │
├─────────────────────────────────────────┤
│                                         │
│  Status: ● Connected                   │
│  Last Sync: 09:15:30 GMT+2             │
│  Poll Interval: 5 minutes               │
│                                         │
│  METRICS:                               │
│  ├─ Checked:   20 emails                │
│  ├─ Ingested:  19 emails ✓              │
│  ├─ Skipped:   1 email                  │
│  ├─ Errors:    0                        │
│  └─ Dedup Rate: 100%                    │
│                                         │
│  FLOW:                                  │
│  SendClaw → [→] → Bridge MCP → [→]     │
│                                         │
└─────────────────────────────────────────┘
```

**Animation:**
- Arrows animate left-to-right to show flow
- Metrics update smoothly with number transitions
- Status indicator pulses when connected

### 4.3 EmailTimeline Component

**Purpose:** Show emails arriving and being ingested.

**Data Structure:**
```typescript
interface Email {
  id: string;
  from: string;
  subject: string;
  received_at: string;
  status: "processing" | "ingested" | "error";
  sys_id?: string;
  error?: string;
}
```

**Display:**
```
┌─────────────────────────────────────────┐
│  EMAIL INGESTION TIMELINE               │
├─────────────────────────────────────────┤
│                                         │
│  09:15 [✓] from: customer@example.com  │
│        Subject: "Urgent: Server Down"  │
│        → sys_email: 0e8d5983c350...    │
│                                         │
│  09:10 [✓] from: support@acme.com      │
│        Subject: "Password Reset"       │
│        → sys_email: 529d9d83c350...    │
│                                         │
│  09:05 [⏳] from: admin@test.com        │
│        Subject: "Weekly Report"        │
│        → Processing...                 │
│                                         │
│  09:00 [✗] from: spam@fake.com         │
│        Subject: "Buy now!"             │
│        → Error: Invalid sender         │
│                                         │
└─────────────────────────────────────────┘
```

**Animation:**
- New emails slide in from top
- Checkmark appears when ingested
- Timestamp updates in real-time
- Errors show in red with icon

### 4.4 CaseCreationFeed Component

**Purpose:** Show ServiceNow cases being created.

**Data Structure:**
```typescript
interface Case {
  number: string;
  sys_id: string;
  short_description: string;
  priority: 1 | 2 | 3 | 4;
  state: string;
  created_at: string;
  email_id?: string;
}
```

**Display:**
```
┌─────────────────────────────────────────┐
│  CASE CREATION FEED                     │
├─────────────────────────────────────────┤
│                                         │
│  [CS0001007] ✓ CREATED                 │
│  Subject: "Urgent: Server Down"        │
│  Priority: 🔴 Critical                 │
│  Created: 09:15 GMT+2                  │
│  Link: dev228466.service-now.com/...   │
│                                         │
│  [CS0001006] ✓ CREATED                 │
│  Subject: "Password Reset"             │
│  Priority: 🟡 High                     │
│  Created: 09:10 GMT+2                  │
│  Link: dev228466.service-now.com/...   │
│                                         │
│  [CS0001005] ✓ CREATED                 │
│  Subject: "Weekly Report"              │
│  Priority: 🟢 Medium                   │
│  Created: 09:05 GMT+2                  │
│  Link: dev228466.service-now.com/...   │
│                                         │
└─────────────────────────────────────────┘
```

**Animation:**
- New cases appear with a "pop" animation
- Priority color changes based on severity
- Link is clickable and opens ServiceNow

### 4.5 ProgressBar Component

**Purpose:** Show overall pipeline progress.

**Display:**
```
┌─────────────────────────────────────────┐
│  PIPELINE PROGRESS                      │
├─────────────────────────────────────────┤
│                                         │
│  Emails Processed: 19/20                │
│  [████████████████░░░░░░░░░░░░░░░░░░░] │
│  95% Complete                           │
│                                         │
│  Success Rate: 100%                     │
│  Avg Processing Time: 2.3s              │
│                                         │
└─────────────────────────────────────────┘
```

---

## 5. API ROUTES

### 5.1 GET /api/agents

**Purpose:** Get list of OpenClaw agents and their status.

**Response:**
```json
{
  "agents": [
    {
      "id": "agent:main:telegram:chomi:direct:6293387112",
      "name": "Chomi",
      "status": "executing",
      "started_at": "2026-05-04T08:38:00Z",
      "progress": 75
    }
  ],
  "total": 1,
  "executing": 1,
  "completed": 0
}
```

**Implementation:**
```typescript
// pages/api/agents.ts
import { readdir, readFile } from "fs/promises";
import { join } from "path";

export default async function handler(req, res) {
  const sessionsDir = join(process.env.HOME, ".openclaw/workspace/sessions");
  const files = await readdir(sessionsDir);
  
  const agents = [];
  for (const file of files) {
    const content = await readFile(join(sessionsDir, file), "utf-8");
    const session = JSON.parse(content);
    agents.push({
      id: session.id,
      name: session.name || "Unknown",
      status: session.status || "unknown",
      started_at: session.started_at,
      progress: calculateProgress(session)
    });
  }
  
  res.json({ agents });
}
```

### 5.2 GET /api/bridge-status

**Purpose:** Get Bridge MCP status and metrics.

**Response:**
```json
{
  "status": "connected",
  "last_sync": "2026-05-04T09:15:30Z",
  "metrics": {
    "checked": 20,
    "ingested": 19,
    "skipped": 1,
    "errors": 0,
    "dedup_rate": 100
  },
  "config": {
    "sendclaw_mailbox": "chomi_agent@sendclaw.com",
    "servicenow_instance": "https://dev228466.service-now.com",
    "poll_interval": 300
  }
}
```

**Implementation:**
```typescript
// pages/api/bridge-status.ts
import { readFile } from "fs/promises";
import { join } from "path";

export default async function handler(req, res) {
  const bridgeDir = "/home/chomi/ChomiVaultSetup/bridge-mcp";
  const processedFile = join(bridgeDir, "processed_emails.json");
  
  const processed = JSON.parse(await readFile(processedFile, "utf-8"));
  
  res.json({
    status: "connected",
    last_sync: new Date().toISOString(),
    metrics: {
      checked: 20,
      ingested: Object.keys(processed).length,
      skipped: 1,
      errors: 0,
      dedup_rate: 100
    }
  });
}
```

### 5.3 GET /api/emails

**Purpose:** Get list of processed emails.

**Response:**
```json
{
  "emails": [
    {
      "id": "3d3de9f6-6fd8-47f0-b890-537380c1f16e",
      "from": "customer@example.com",
      "subject": "Urgent: Server Down",
      "received_at": "2026-05-04T09:15:00Z",
      "status": "ingested",
      "sys_id": "0e8d5983c3500310dd075f2b2b0131a4"
    }
  ],
  "total": 19
}
```

### 5.4 GET /api/cases

**Purpose:** Get list of ServiceNow cases created.

**Response:**
```json
{
  "cases": [
    {
      "number": "CS0001007",
      "sys_id": "abc123",
      "short_description": "Urgent: Server Down",
      "priority": 1,
      "state": "new",
      "created_at": "2026-05-04T09:15:30Z"
    }
  ],
  "total": 19
}
```

### 5.5 GET /api/stream

**Purpose:** Server-Sent Events stream for real-time updates.

**Implementation:**
```typescript
// pages/api/stream.ts
export default async function handler(req, res) {
  res.setHeader("Content-Type", "text/event-stream");
  res.setHeader("Cache-Control", "no-cache");
  res.setHeader("Connection", "keep-alive");
  
  const interval = setInterval(async () => {
    const status = await getBridgeStatus();
    res.write(`data: ${JSON.stringify(status)}\n\n`);
  }, 5000); // Update every 5 seconds
  
  req.on("close", () => clearInterval(interval));
}
```

---

## 6. COMPONENT IMPLEMENTATION EXAMPLE

### AgentMonitor.tsx

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
    const interval = setInterval(fetchAgents, 5000); // Poll every 5s
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

---

## 7. STYLING GUIDE

### Color Scheme
- **Background:** `#0f172a` (slate-900)
- **Text:** `#f1f5f9` (slate-100)
- **Accent:** `#3b82f6` (blue-500)
- **Success:** `#10b981` (green-500)
- **Warning:** `#f59e0b` (amber-500)
- **Error:** `#ef4444` (red-500)

### Typography
- **Headings:** Inter Bold, 20px
- **Body:** Inter Regular, 14px
- **Mono:** Fira Code, 12px

### Spacing
- **Padding:** 16px (components), 24px (sections)
- **Gap:** 12px (items), 16px (sections)
- **Border Radius:** 8px

---

## 8. DEPLOYMENT

### Development
```bash
npm install
npm run dev
# Open http://localhost:3000
```

### Production (Vercel)
```bash
npm install -g vercel
vercel
# Follow prompts
```

### Self-hosted
```bash
npm run build
npm start
# Runs on port 3000
```

---

## 9. RECORDING GUIDE

### OBS Studio Setup
1. **Scene:** 1920x1080 (16:9)
2. **Source:** Browser (http://localhost:3000)
3. **Audio:** System audio (optional)
4. **Bitrate:** 6000 kbps (YouTube quality)

### Recording Steps
1. Start dashboard
2. Send test email to `chomi_agent@sendclaw.com`
3. Hit record in OBS
4. Wait for email to appear in dashboard
5. Watch case creation in real-time
6. Stop recording

### Editing
- **Software:** DaVinci Resolve (free) or Adobe Premiere
- **Duration:** 2-3 minutes
- **Cuts:** Remove idle time, speed up waiting
- **Captions:** Add text overlays for key moments
- **Music:** Royalty-free background (Epidemic Sound, Artlist)

---

## 10. TESTING CHECKLIST

- [ ] All API routes return correct data
- [ ] Components render without errors
- [ ] Real-time updates work (polling/SSE)
- [ ] Animations are smooth
- [ ] Mobile responsive (optional)
- [ ] Dark mode works
- [ ] Links to ServiceNow are correct
- [ ] Error states display properly
- [ ] Performance is acceptable (<1s load time)

---

**Next Step:** Begin implementation with Next.js project setup.

