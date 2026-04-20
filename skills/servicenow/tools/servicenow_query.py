#!/usr/bin/env python3
"""
ServiceNow Query Tool
Connect to ServiceNow PDI and query records
"""
import sys
import json
from pysnow import Client

def main():
    # Load credentials from env
    instance_url = open("/home/chomi/.openclaw/workspace/servicenow.env").read()
    for line in instance_url.split("\n"):
        if "=" in line:
            key, val = line.strip().split("=", 1)
            if key == "SERVICENOW_INSTANCE_URL":
                # Extract instance name from URL like https://dev228466.service-now.com/
                instance = val.replace("https://", "").replace(".service-now.com/", "").replace("/", "")
            elif key == "SERVICENOW_USERNAME":
                user = val
            elif key == "SERVICENOW_PASSWORD":
                password = val
    
    client = Client(instance=instance, user=user, password=password)
    
    # Default to incidents
    table = sys.argv[1] if len(sys.argv) > 1 else "incident"
    limit = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    
    records = client.resource(api_path=f"/table/{table}")
    response = records.get(parameters={"sysparm_limit": limit})
    results = response.all()
    
    print(f"✅ {len(results)} records from {table}:")
    for r in results:
        print(f"  - {r.get('number', r.get('sys_id', 'N/A'))}: {r.get('short_description', r.get('name', 'N/A'))}")

if __name__ == "__main__":
    main()
