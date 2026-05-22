#!/usr/bin/env node

/**
 * Daily Agentic AI + ServiceNow Scout
 * Finds LinkedIn posts about agentic AI + ServiceNow and flags elevation opportunities
 * Runs daily at 9:30 AM SAST
 * 
 * Usage: node daily-agentic-ai-scout.js
 */

const fs = require('fs');
const path = require('path');

const WORKSPACE = process.env.WORKSPACE || path.join(process.env.HOME, '.openclaw/workspace');
const OUTPUT_DIR = path.join(WORKSPACE, 'research/agentic-ai-scout');
const TIMESTAMP = new Date().toISOString().split('T')[0];
const OUTPUT_FILE = path.join(OUTPUT_DIR, `${TIMESTAMP}-agentic-ai-scout.md`);

// Ensure output directory exists
if (!fs.existsSync(OUTPUT_DIR)) {
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

// Search queries to monitor
const SEARCH_QUERIES = [
  {
    name: '#BuildAgent + #ServiceNow',
    query: '#BuildAgent #ServiceNow',
    description: 'Build Agent automation posts'
  },
  {
    name: '#AgenticAI + #ServiceNow',
    query: '#AgenticAI #ServiceNow',
    description: 'Agentic AI + ServiceNow posts'
  },
  {
    name: 'ServiceNow + "autonomous"',
    query: 'ServiceNow autonomous',
    description: 'Autonomous ServiceNow posts'
  },
  {
    name: '#AIControlTower',
    query: '#AIControlTower',
    description: 'AI Control Tower posts'
  },
  {
    name: 'ServiceNow + "AI agents"',
    query: 'ServiceNow "AI agents"',
    description: 'AI agents on ServiceNow posts'
  }
];

// Elevation categories
const ELEVATION_CATEGORIES = {
  'Task Automation → Agentic Teams': {
    keywords: ['automate', 'execute', 'task', 'workflow', 'process'],
    angle: 'This is what\'s possible with task automation. Here\'s what\'s possible with agentic teams that reason about the operating model.'
  },
  'CMDB/Governance Foundation': {
    keywords: ['CMDB', 'governance', 'data quality', 'relationships', 'foundation'],
    angle: 'Before you automate, you need a clean foundation. Here\'s how agentic experts fix it.'
  },
  'Build Agent Limitations': {
    keywords: ['limitation', 'constraint', 'workaround', 'can\'t', 'cannot'],
    angle: 'Here are the boundaries. Here\'s how agentic teams work within them.'
  },
  'OOTB-First Philosophy': {
    keywords: ['OOTB', 'out-of-the-box', 'customization', 'platform'],
    angle: 'Know what\'s OOTB. Then let agentic teams extend it intelligently.'
  },
  'Expert Reasoning': {
    keywords: ['expert', 'architect', 'reasoning', 'judgment', 'understand'],
    angle: 'This is where expert agents add value — reasoning about the operating model, not just executing.'
  }
};

/**
 * Generate the scout report
 */
function generateReport() {
  const now = new Date();
  const report = `# Agentic AI + ServiceNow Scout Report

**Generated:** ${now.toISOString()}
**Date:** ${TIMESTAMP}

## Overview

Daily scout for LinkedIn posts about agentic AI + ServiceNow that can be elevated from pure automation to agentic teams perspective.

---

## Search Queries Monitored

${SEARCH_QUERIES.map(q => `### ${q.name}
**Query:** ${q.query}
**Description:** ${q.description}
**Status:** Awaiting results (requires X Research skill with API credits)

`).join('')}

---

## Elevation Categories

${Object.entries(ELEVATION_CATEGORIES).map(([category, config]) => `### ${category}

**Keywords:** ${config.keywords.join(', ')}

**Elevation Angle:**
> ${config.angle}

`).join('')}

---

## How to Use This Scout

1. **Manual Search:** Use X Research skill to search LinkedIn for each query
2. **Categorize:** Assign posts to elevation categories based on keywords
3. **Flag:** Mark high-signal posts for team discussion
4. **Elevate:** Propose how to reframe from pure automation to agentic teams angle

---

## Key Insights to Look For

- **Trend:** More posts about Build Agent in IDEs (Cursor, Windsurf, Claude Code)
- **Gap:** Governance discipline is the blocker, not tooling
- **Opportunity:** CMDB hygiene is where agentic teams add value
- **Vision:** AI Control Tower + clean CMDB = trustworthy autonomous operations
- **Edge:** Independent expert agents vs. task automation

---

## Next Actions

1. Review posts for content opportunities
2. Flag high-signal posts for team discussion
3. Identify elevation angles for Chomi's perspective
4. Consider guest posts or responses
5. Track trends over time

---

## Notes

- This is a template. Actual implementation requires X Research skill with API credits.
- Manual searches can be done via LinkedIn directly.
- Focus on posts from: @lucamorlupi, @ianmarkcox, @bwilson85, @tusshar-mishra, @guilhermebatistasilva
- Track trending hashtags: #BuildAgent, #AgenticAI, #ServiceNow, #AIControlTower

---

**Scout Status:** Ready for manual execution
**Last Updated:** ${TIMESTAMP}
**Maintained by:** Chomi
**For:** Elevating automation posts to agentic teams perspective
`;

  return report;
}

/**
 * Main execution
 */
function main() {
  try {
    const report = generateReport();
    
    // Write report
    fs.writeFileSync(OUTPUT_FILE, report, 'utf8');
    console.log(`✅ Scout report created: ${OUTPUT_FILE}`);
    
    // Try to commit to git
    const { execSync } = require('child_process');
    try {
      process.chdir(WORKSPACE);
      execSync('git add research/agentic-ai-scout/', { stdio: 'pipe' });
      execSync(`git commit -m "Daily agentic AI scout: ${TIMESTAMP}"`, { stdio: 'pipe' });
      execSync('git push origin main', { stdio: 'pipe' });
      console.log('✅ Committed and pushed to git');
    } catch (gitError) {
      console.log('⚠️  Git commit/push failed (non-critical):', gitError.message);
    }
    
    process.exit(0);
  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

main();
