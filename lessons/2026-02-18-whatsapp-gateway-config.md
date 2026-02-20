---
primitive: lesson
title: "Chomi responds to all WhatsApp messages by default"
type: "mistake"
source: "direct-experience"
confidence: 1.0
applied: true
date: "2026-02-18"
---

# Chomi responds to all WhatsApp messages by default

## Context
Gateway was configured to forward all incoming WhatsApp messages to Chomi, causing her to respond to random contacts, family groups, and spam messages.

## Lesson
Always configure gateway to only route DIRECT messages to the agent, not all chats. The agent should have its own dedicated number or filter rules to prevent accidental responses to wrong contacts.

## Action Items
- [x] Give Chomi her own dedicated number
- [x] Configure gateway to only respond to direct messages
- [ ] Add message filtering rules

## Note
Thaby solved this by getting Chomi her own WhatsApp number so she only responds when messaged directly.
