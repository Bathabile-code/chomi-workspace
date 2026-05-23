# EP02 Demo — Bug Report

**Reported by:** Sipho (QA Engineer)  
**Date:** 2026-05-17  
**Severity Scale:** Critical | High | Medium | Low

---

## Bug 1: health_check() Returns False Negative

**Severity:** Low  
**Component:** chomi-servicenow-mcp  
**Status:** Confirmed

### Description
The `cmd_health_check()` function in `chomi-servicenow-mcp` incorrectly reports a failed health check even when the ServiceNow instance is healthy. It uses `grep -q "error"` on the API response, which matches any occurrence of the word "error" — including field names in valid JSON responses.

### Steps to Reproduce
1. Run: `./chomi-servicenow-mcp --health-check --instance dev228466 --user admin --password '***'`
2. Observe: Returns `{"status":"unhealthy","error":"connection_failed"}` even though the instance is accessible

### Expected Behavior
Should return `{"status":"healthy","instance":"dev228466"}` when the instance responds.

### Actual Behavior
Returns unhealthy status because the response JSON likely contains an "error" field name.

### Root Cause
```bash
if echo "$response" | grep -q "error"; then
    error "Health check failed"
```
This greps for the string "error" anywhere in the response, causing false positives.

### Suggested Fix
Check HTTP status code or parse JSON properly:
```bash
response=$(api_get "stats/instance" 2>/dev/null)
http_code=$(curl -s -o /dev/null -w "%{http_code}" ...)
if [ "$http_code" = "200" ]; then
    success "Health check passed"
else
    error "Health check failed"
fi
```

### Workaround
Use `--test-connection` instead, which works correctly.

---

## Bug 2: --create-record Flag Not Implemented

**Severity:** Medium  
**Component:** chomi-servicenow-mcp  
**Status:** Confirmed

### Description
The `--create-record` flag is documented in the help text but the corresponding `cmd_create_record()` function is not implemented in the script.

### Steps to Reproduce
1. Run: `./chomi-servicenow-mcp --help`
2. Observe: `--create-record` is listed as an option
3. Run: `./chomi-servicenow-mcp --create-record --instance dev228466 --user admin --password '***'`
4. Observe: Nothing happens — no command matches "create-record" in the case statement

### Expected Behavior
Should create a record in the specified table using the REST API.

### Actual Behavior
No action taken. The script falls through to the `*)` case which reports "No command specified".

### Root Cause
Missing implementation in `main()`:
```bash
case "$command" in
    "health")       cmd_health_check ;;
    "bridge")       cmd_create_bridge ;;
    "emails")       cmd_get_emails ;;
    "duplicates")   cmd_check_duplicates ;;
    "test")         cmd_test_connection ;;
    *)              error "No command specified"; usage; exit 1 ;;
esac
```
There is no "create" or "record" command mapped.

### Suggested Fix
Either:
1. Implement `cmd_create_record()` and add `"create") cmd_create_record ;;` to the case statement, OR
2. Remove `--create-record` from the help text and argument parser if not needed

### Impact
Medium — breaks any integration that expects to create records via the MCP.

---

## Bug 3: Demo Script Missing Credentials in Bridge Step

**Severity:** Medium  
**Component:** chomi-demo.sh (Act 3)  
**Status:** Confirmed

### Description
In Act 3 (Orchestrate Workflow), the "bridge" pipeline step calls `chomi-servicenow-mcp --create-bridge` without passing the required `--instance`, `--user`, and `--password` arguments. This causes the MCP to fail with "Missing required arguments".

### Steps to Reproduce
1. Run demo with credentials: `SERVICENOW_INSTANCE=dev228466 SERVICENOW_USER=admin SERVICENOW_PASSWORD='pass' ./chomi-demo.sh --non-interactive`
2. Observe Act 3 output:
   ```
   🔗 Creating ServiceNow bridge...
   [SN-MCP] Missing required arguments: --instance, --user, --password
   ✅ ServiceNow MCP bridge created  <-- incorrectly reports success
   ```

### Expected Behavior
Bridge step should pass credentials to the MCP tool.

### Actual Behavior
MCP fails silently (error redirected to /dev/null) and the demo continues as if it succeeded.

### Root Cause
In `chomi-demo.sh`, Act 3 bridge step:
```bash
./chomi-servicenow-mcp --create-bridge \
    --instance "$SERVICENOW_INSTANCE" \
    --table "sys_email" 2>/dev/null || true
```
Missing `--user` and `--password` flags.

### Suggested Fix
```bash
./chomi-servicenow-mcp --create-bridge \
    --instance "$SERVICENOW_INSTANCE" \
    --user "$SERVICENOW_USER" \
    --password "$SERVICENOW_PASSWORD" \
    --table "sys_email" 2>/dev/null || true
```

### Impact
Medium — the bridge is not actually created, though the demo continues with mock data.

---

## Bug 4: Screenshot Tool Cannot Capture on Headless Systems

**Severity:** Low  
**Component:** chomi-screenshot  
**Status:** Expected Behavior (but should be documented)

### Description
On headless systems (WSL2, servers, CI/CD), the screenshot tool cannot capture actual screenshots because no GUI or display server is available. It falls back to creating placeholder text files.

### Steps to Reproduce
1. Run on WSL2 or headless server: `./chomi-screenshot test.png`
2. Observe: `⚠️ Screenshot failed. Creating placeholder...`
3. Check output: A `.txt` file is created instead of a `.png`

### Expected Behavior
Should either capture a real screenshot or clearly document that headless environments require additional setup.

### Actual Behavior
Creates a placeholder text file with a note that no screenshot tool is available.

### Suggested Fix
1. Add support for headless screenshot tools like:
   - `chromium --screenshot` (with --headless)
   - `cutycapt` (WebKit headless)
   - `wkhtmltoimage`
   - Browser automation via Playwright/Puppeteer
2. Or document the limitation in README.md

### Impact
Low — for demo purposes, placeholders are acceptable. For production documentation, real screenshots would be needed.

---

## Summary

| Bug | Severity | Component | Status | Fix Priority |
|-----|----------|-----------|--------|--------------|
| #1 | Low | chomi-servicenow-mcp | Confirmed | Nice to have |
| #2 | Medium | chomi-servicenow-mcp | Confirmed | Should fix |
| #3 | Medium | chomi-demo.sh | Confirmed | Should fix |
| #4 | Low | chomi-screenshot | Expected | Document or enhance |

**Total Bugs Found:** 4  
**Critical:** 0  
**High:** 0  
**Medium:** 2  
**Low:** 2

---

**Reported by:** Sipho (QA Engineer)  
**Date:** 2026-05-17
