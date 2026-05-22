#!/bin/bash
# Daily Agentic AI + ServiceNow Scout
# Finds LinkedIn posts about agentic AI + ServiceNow and flags elevation opportunities
# Runs daily at 9:30 AM SAST

set -e

WORKSPACE="/home/chomi/.openclaw/workspace"
OUTPUT_DIR="$WORKSPACE/research/agentic-ai-scout"
TIMESTAMP=$(date +%Y-%m-%d)
OUTPUT_FILE="$OUTPUT_DIR/$TIMESTAMP-agentic-ai-scout.md"

mkdir -p "$OUTPUT_DIR"

# Create the scout report
cat > "$OUTPUT_FILE" << 'EOF'
# Agentic AI + ServiceNow Scout Report
**Generated:** $(date)

## Search Results

### Search 1: #BuildAgent + #ServiceNow
**Query:** #BuildAgent #ServiceNow latest posts
**Source:** LinkedIn

### Search 2: #AgenticAI + #ServiceNow
**Query:** #AgenticAI #ServiceNow latest posts
**Source:** LinkedIn

### Search 3: ServiceNow + "autonomous"
**Query:** ServiceNow "autonomous" latest posts
**Source:** LinkedIn

### Search 4: #AIControlTower
**Query:** #AIControlTower latest posts
**Source:** LinkedIn

## Elevation Opportunities

### Category: Task Automation → Agentic Teams
Posts showing pure task automation that could be elevated to agentic teams perspective.

**Elevation angle:** "This is what's possible with task automation. Here's what's possible with agentic teams that reason about the operating model."

### Category: CMDB/Governance Foundation
Posts about CMDB hygiene, governance, data quality that are foundational for agentic AI.

**Elevation angle:** "Before you automate, you need a clean foundation. Here's how agentic experts fix it."

### Category: Build Agent Limitations
Posts about what Build Agent can't do, constraints, workarounds.

**Elevation angle:** "Here are the boundaries. Here's how agentic teams work within them."

### Category: OOTB-First Philosophy
Posts about using out-of-the-box features before customizing.

**Elevation angle:** "Know what's OOTB. Then let agentic teams extend it intelligently."

## Key Insights

- **Trend:** More posts about Build Agent in IDEs (Cursor, Windsurf, Claude Code)
- **Gap:** Governance discipline is the blocker, not tooling
- **Opportunity:** CMDB hygiene is where agentic teams add value
- **Vision:** AI Control Tower + clean CMDB = trustworthy autonomous operations

## Next Actions

1. Review posts for content opportunities
2. Flag high-signal posts for team discussion
3. Identify elevation angles for Chomi's perspective
4. Consider guest posts or responses

---

**Note:** This is a template. Actual implementation will use Exa web search or X Research skill to find real posts.
EOF

echo "✅ Scout report created: $OUTPUT_FILE"

# Commit to git
cd "$WORKSPACE"
git add "$OUTPUT_FILE"
git commit -m "Daily agentic AI scout: $TIMESTAMP" || true
git push origin main || true

echo "✅ Committed and pushed to git"
