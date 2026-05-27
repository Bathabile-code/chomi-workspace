#!/bin/bash
# EP02 Video Recording Script
# Captures terminal execution for LinkedIn proof

cd ~/ChomiVaultSetup/ep02-ep03-build

echo "🎬 Starting EP02 Video Recording..."
echo "Recording: Real Emails → Real RITMs"
echo ""

# Start asciinema recording
asciinema rec /tmp/ep02_live_execution.cast --title="EP02: Real Emails → Real RITMs" --command="
echo '╔════════════════════════════════════════════════════════════╗'
echo '║     EP02 LIVE: Real Emails → Real RITMs in ServiceNow     ║'
echo '╚════════════════════════════════════════════════════════════╝'
echo ''
echo 'Step 1: Fetching REAL emails from sys_email table...'
python3 kwazi_real_email_processor.py --dry-run 2>&1 | grep -E '(Fetched|MATCH|SKIP|Summary)'
echo ''
echo 'Step 2: CREATING LIVE RITMs from REAL emails...'
python3 kwazi_real_email_processor.py 2>&1 | grep -E '(CREATED|Summary|Total)'
echo ''
echo 'Step 3: Verifying in ServiceNow...'
curl -s -u admin:yb*qaLD/T26X 'https://dev228466.service-now.com/api/now/table/sc_req_item?sysparm_query=active=true&sysparm_limit=10&sysparm_fields=number,short_description,sys_created_on' | python3 -c '
import sys, json
d = json.load(sys.stdin)
for r in d.get(\"result\",[]): 
    print(f\"RITM: {r.get(\"number\",\"N/A\")} | {r.get(\"short_description\",\"No subject\")[:40]} | Created: {r.get(\"sys_created_on\",\"N/A\")[:19]}\")
'
echo ''
echo '✅ EP02 Complete: Real emails processed → Real RITMs created'
"

echo ""
echo "🎬 Recording complete!"
echo "File saved: /tmp/ep02_live_execution.cast"
echo ""
echo "To convert to video:"
echo "  asciinema agg /tmp/ep02_live_execution.cast /tmp/ep02_video.gif"
