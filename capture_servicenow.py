#!/usr/bin/env python3
"""
EP02 ServiceNow Screenshot Capture
Uses Playwright + system Chromium to screenshot actual ServiceNow UI
"""

import asyncio
from playwright.async_api import async_playwright

# ServiceNow credentials
INSTANCE = "https://dev228466.service-now.com"
USERNAME = "admin"
PASSWORD = "yb*qaLD/T26X"

async def capture_servicenow_screenshots():
    async with async_playwright() as p:
        # Use system Chromium (already installed in WSL)
        browser = await p.chromium.launch(
            headless=True,
            executable_path="/usr/bin/chromium-browser"
        )
        context = await browser.new_context(viewport={"width": 1920, "height": 1080})
        page = await context.new_page()
        
        print("🎬 Starting ServiceNow Screenshot Capture...")
        print(f"📍 Instance: {INSTANCE}")
        print()
        
        # Step 1: Login to ServiceNow
        print("Step 1: Logging into ServiceNow...")
        await page.goto(f"{INSTANCE}/login.do", wait_until="networkidle")
        await page.fill("#user_name", USERNAME)
        await page.fill("#user_password", PASSWORD)
        await page.click("#sysverb_login")
        
        # Wait for navigation
        await page.wait_for_timeout(5000)
        
        current_url = page.url
        print(f"Current URL: {current_url}")
        
        if "login" in current_url:
            print("⚠️  Still on login page - MFA may be required")
            await page.screenshot(path="/tmp/servicenow_login.png", full_page=True)
            print("📸 Screenshot saved: /tmp/servicenow_login.png")
        else:
            print("✅ Logged in!")
            
            # Step 2: Screenshot RITM list
            print("\nStep 2: RITM list...")
            await page.goto(f"{INSTANCE}/sc_req_item_list.do?sysparm_query=active=true", wait_until="networkidle")
            await page.wait_for_timeout(3000)
            await page.screenshot(path="/tmp/servicenow_ritm_list.png", full_page=True)
            print("📸 Screenshot: /tmp/servicenow_ritm_list.png")
            
            # Step 3: Click first RITM
            print("\nStep 3: Opening RITM detail...")
            links = await page.query_selector_all("a.linked.formlink")
            if links:
                await links[0].click()
                await page.wait_for_timeout(3000)
                await page.screenshot(path="/tmp/servicenow_ritm_detail.png", full_page=True)
                print("📸 Screenshot: /tmp/servicenow_ritm_detail.png")
        
        await browser.close()
        print("\n✅ Complete! Check /tmp/ for screenshots")

if __name__ == "__main__":
    asyncio.run(capture_servicenow_screenshots())
