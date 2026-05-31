---
name: use-tinyfish
description: Use TinyFish web agent to extract/scrape websites, extract data, and automate browser actions using natural language. Use when you need to extract/scrape data from websites, handle bot-protected sites, or automate web tasks.
---

# Use TinyFish

## Overview

You have access to the TinyFish CLI (`tinyfish`) — a suite of web tools you can call from the terminal.

## Installation

```bash
# If not installed
npm install -g @tiny-fish/cli

# If not authenticated  
tinyfish auth login
# OR set env var
export TINYFISH_API_KEY=your_key_here
```

Get keys at: https://agent.tinyfish.ai/api-keys

## Tool Escalation Path

Start with the lightest tool for the job. Escalate only when needed.

```
search → fetch → agent → browser
lightest              heaviest
```

| Tool | When to use | Speed | Cost |
|------|-------------|-------|------|
| **search** | Find URLs or quick answers | Fastest | Lowest |
| **fetch** | Have URLs, need clean content | Fast | Low |
| **agent** | Need to interact (click, fill forms, extract structured data) | Slower | Higher |
| **browser** | Agent not enough — need raw CDP browser control | Slowest | Highest |

## Commands

### 1. Search
Find URLs and get quick answers.

```bash
tinyfish search query "best React state management libraries 2026"
tinyfish search query "best pho in Ho Chi Minh City" --location "Vietnam" --language "en"
```

### 2. Fetch
Get clean, extracted content from URLs (strips ads, nav, boilerplate).

```bash
# Single page
tinyfish fetch content get --format markdown "https://example.com/article"

# Multiple pages (parallel)
tinyfish fetch content get --links "https://site-a.com" "https://site-b.com"

# With all links extracted
tinyfish fetch content get --format markdown --links --image-links "https://example.com"
```

### 3. Agent
Browser automation with natural language goals. Opens a real browser, clicks, fills forms, extracts structured data.

```bash
# Extract products as JSON
tinyfish agent run --url "https://example.com/products" \
  "Extract all products as JSON array: [{\"name\": str, \"price\": str, \"url\": str}]"

# Search and filter
tinyfish agent run --url "https://example.com/search" \
  "Search for 'wireless headphones', filter under $50, extract top 5 as JSON"

# Wait for full result (no streaming)
tinyfish agent run --sync --url "https://nike.com/running" \
  "Extract all running shoes as JSON: [{\"name\": str, \"price\": str, \"colors\": [str]}]"
```

**Parallel extraction** — when hitting multiple independent sites, make separate calls. Don't combine into one goal.

```bash
# ✅ GOOD — parallel calls (run simultaneously)
tinyfish agent run --url "https://pizzahut.com" \
  "Extract pizza prices as JSON: [{\"name\": str, \"price\": str}]"
  
tinyfish agent run --url "https://dominos.com" \
  "Extract pizza prices as JSON: [{\"name\": str, \"price\": str}]"

# ❌ BAD — single combined call (less reliable and slower)
tinyfish agent run --url "https://pizzahut.com" \
  "Extract prices from Pizza Hut and also go to Dominos..."
```

**Manage runs:**
```bash
tinyfish agent run list
tinyfish agent run list --status RUNNING
tinyfish agent run get <run_id>
tinyfish agent run cancel <run_id>
```

**Batch operations** — from CSV (url,goal columns):
```bash
tinyfish batch run --input runs.csv
tinyfish batch list
tinyfish batch get <batch_id>
tinyfish batch cancel <batch_id>
```

### 4. Browser
Spin up a remote browser instance for raw CDP programmatic control.

```bash
# Create browser session
tinyfish browser session create --url "https://example.com"

# Returns: { session_id, cdp_url: "wss://...", base_url: "https://..." }
# Use cdp_url with Playwright, Puppeteer, or any CDP client
```

## Common Workflows

### Research: search → fetch
```bash
# 1. Find URLs
tinyfish search query "best React state management libraries 2026"

# 2. Read the top results
tinyfish fetch content get --format markdown "https://result1.com" "https://result2.com"
```

### Deep extraction: search → agent
```bash
# 1. Find the site
tinyfish search query "Nike running shoes official store"

# 2. Automate extraction
tinyfish agent run --url "https://nike.com/running" \
  "Extract all running shoes as JSON: [{\"name\": str, \"price\": str, \"colors\": [str]}]"
```

### Escalation: fetch → agent
```bash
# Try fetch first — if page is dynamic/JS-heavy, escalate to agent
tinyfish fetch content get --format markdown "https://dynamic-site.com"
# If returns empty/incomplete...
tinyfish agent run --url "https://dynamic-site.com" \
  "Extract the main article content as markdown"
```

## Tips

- Always specify the JSON structure you want in the agent goal
- Use `--sync` to wait for full result without streaming
- Use `--pretty` for human-readable output (default is JSON)
- Use `--debug` or set `TINYFISH_DEBUG=1` to log HTTP requests
- Match the user's language: Respond in whatever language they write in

---

**Web scraping, data extraction, and browser automation powered by natural language.** 🎣
