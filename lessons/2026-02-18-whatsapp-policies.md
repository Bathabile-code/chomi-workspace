---
primitive: lesson
title: "Lock down WhatsApp policies before enabling public DMs"
type: "insight"
source: "direct-experience"
confidence: 1.0
applied: true
date: "2026-02-18"
---

# Lock down WhatsApp policies before enabling public DMs

## Context
Chomi was configured with WhatsApp gateway forwarding all incoming messages. This caused her to respond to:
- Random unknown numbers (potential spam/phishing)
- Family groups (birthday messages, personal chats)
- Anyone who had Thaby's number

Result: Accidental spam to contacts, family group posts, and reputation damage.

## Lesson
**Never enable agent access to channels without restrictive policies first.**

### Order of Operations:
1. ✅ Configure message filtering (allowlist only)
2. ✅ Set up rate limiting
3. ✅ Define auto-response rules
4. ✅ Test in controlled environment
5. ✅ THEN enable gateway

### What Should Have Been Set:
- `allowed_contacts` - only respond to known numbers
- `group_chat_policy` - ignore all group messages
- `auto_response` - off by default
- `forward_to_primary` - route unknown messages to human first

## Action Items
- [x] Got Chomi her own dedicated number
- [x] Only route direct messages to her number
- [ ] Add contact allowlist for known contacts
- [ ] Set group chat ignore policy

## Tags
#security #whatsapp #policies #automation
