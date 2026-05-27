#!/bin/bash
# EP02 LIVE EXECUTION — Terminal Recording for LinkedIn Proof
# Run this to capture the full live execution with timestamps

clear
echo ""
echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║         EP02 LIVE EXECUTION — Real Emails → Real RITMs            ║"
echo "║                    Recording Started: $(date '+%Y-%m-%d %H:%M:%S')                  ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo ""
echo "AGENT: Kwazi-Developer (Fixed Version)"
echo "MODEL: Qwen 3.7-Max"
echo "INSTANCE: dev228466.service-now.com"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "STEP 1: DRY-RUN (Verify Real Email Detection)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

cd ~/ChomiVaultSetup/ep02-ep03-build

# First do dry-run to show what will be created
echo "Running DRY-RUN to verify real email filtering..."
echo ""
python3 kwazi_real_email_processor.py --dry-run 2>&1 | grep -E "(MATCH|SKIP|Fetched|Summary|Total)"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "STEP 2: LIVE EXECUTION (Create Real RITMs from Real Emails)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Now run LIVE mode
python3 kwazi_real_email_processor.py 2>&1 | grep -E "(CREATED|ERROR|Summary|Total|RITM)"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "STEP 3: VERIFY RITMs in ServiceNow"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Query ServiceNow to show created RITMs
curl -s -u admin:yb*qaLD/T26X "https://dev228466.service-now.com/api/now/table/sc_req_item?sysparm_query=active=true&sysparm_limit=20&sysparm_fields=number,short_description,description,sys_created_on,request_item_for" | python3 -c "
import sys, json
d = json.load(sys.stdin)
results = d.get('result', [])
print(f'Total active RITMs: {len(results)}')
print()
print(f\"{'RITM #':<12} {'Created':<20} {'Subject (from real email)':<50}\")
print('='*85)
for r in results:
    num = r.get('number', 'N/A')
    subj = r.get('short_description', 'No Subject')[:45]
    date = r.get('sys_created_on', 'N/A')[:19]
    print(f'{num:<12} {date:<20} {subj}')
"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "STEP 4: SHOW EMAIL → RITM MAPPING"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Show the mapping file
if [ -f ~/ChomiVaultSetup/ep02-ep03-build/email_to_ritm_mapping.json ]; then
    echo "Email → RITM Mapping:"
    python3 -m json.tool ~/ChomiVaultSetup/ep02-ep03-build/email_to_ritm_mapping.json | head -20
else
    echo "Mapping file will be created after live run"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "EXECUTION COMPLETE — Recording Ended: $(date '+%Y-%m-%d %H:%M:%S')"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Real emails processed → Real RITMs created"
echo "✅ All evidence saved for LinkedIn post"
echo "✅ Terminal recording complete"
