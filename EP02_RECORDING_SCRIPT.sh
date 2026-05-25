#!/bin/bash
# EP02 Physical Proof Recording Script
# This script records the actual agent team working headlessly

echo "🎬 EP02 Physical Proof Recording"
echo "=================================="
echo ""

# Setup terminal for recording
echo "Setting up terminal..."
export PS1="\[\033[1;32m\]EP02-DEMO\[\033[0m\]:\w\$ "
clear

# Scene 1: Show the team
echo ""
echo "🏗️ EXPERT AGENT TEAM"
echo "===================="
echo ""
echo "🔒 Raksha-Architect  → Approval Layer (owns every solution)"
echo "⚙️  Kwazi-Developer   → RITM Creation (API integration)"
echo "📞 Thuluzi-ServiceDesk → Escalation Execution (after approval)"
echo "🔎 Bhinca-QA         → Independent Validation"
echo "🧠 Chomi-Orchestrator → Coordination & Reporting"
echo ""

# Scene 2: Show Kwazi's code
echo ""
echo "📁 KWAZI'S DELIVERABLE"
echo "====================="
echo ""
echo "Files built:"
ls -lh ~/ChomiVaultSetup/ep02-ep03-build/kwazi_ritm_builder.py
echo ""
echo "Test results:"
cd ~/ChomiVaultSetup/ep02-ep03-build && python3 test_kwazi.py 2>&1 | tail -5
echo ""

# Scene 3: Show Raksha's code
echo ""
echo "📁 RAKSHA'S DELIVERABLE"
echo "======================="
echo ""
echo "Files built:"
ls -lh ~/ChomiVaultSetup/ep02-ep03-build/raksha_approval_engine.py
echo ""
echo "Test: Review escalation email"
cd ~/ChomiVaultSetup/ep02-ep03-build && python3 -c "
from raksha_approval_engine import review_escalation
import json

# Test 1: CRITICAL escalation
r = review_escalation('URGENT: Server outage', 'Production database is down', 'admin@example.com')
print('Test 1 - CRITICAL:')
print(json.dumps({'decision': r['decision'], 'priority': r['priority'], 'token': r['token']}, indent=2))
print()

# Test 2: LOW priority (should be REQUEST_INFO or REJECT)
r2 = review_escalation('Low priority request', 'Please help with printer setup', 'user@example.com')
print('Test 2 - LOW:')
print(json.dumps({'decision': r2['decision'], 'priority': r2['priority']}, indent=2))
"
echo ""

# Scene 4: Show the architecture
echo ""
echo "🏗️ HEADLESS ARCHITECTURE"
echo "========================"
echo ""
echo "Email → MCP Bridge → sys_email → Kwazi (RITM) → Bhinca (QA) → Escalation → Raksha (Approve) → Thuluzi (Case) → Bhinca (QA)"
echo ""
echo "✅ 100% Headless — Zero UI interaction"
echo "✅ AI Agent in the loop — No human approval needed"
echo "✅ Checks & Balances — Raksha owns every solution"
echo ""

# Scene 5: Show audit trail
echo ""
echo "📊 AUDIT TRAIL"
echo "=============="
echo ""
if [ -f ~/ChomiVaultSetup/ep02-ep03-build/raksha_audit_log.jsonl ]; then
    echo "Raksha's decisions logged:"
    tail -3 ~/ChomiVaultSetup/ep02-ep03-build/raksha_audit_log.jsonl | python3 -m json.tool --compact 2>/dev/null || tail -3 ~/ChomiVaultSetup/ep02-ep03-build/raksha_audit_log.jsonl
else
    echo "Audit log will be created during live demo"
fi
echo ""

echo ""
echo "🎬 Recording complete!"
echo ""
echo "Next: Live end-to-end test with real emails"
echo ""
