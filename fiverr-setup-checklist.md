# 🤖 OpenClaw Setup Checklist
### Professional Service Delivery Guide
*Created by Zuri | OpenClaw Setup Specialist*

---

## 📋 Pre-Requisites (15 min)

- [ ] Node.js 22+ installed (`node -v` to check)
- [ ] OpenClaw installed (`npm install -g openclaw`)
- [ ] API key for LLM provider (OpenRouter, OpenAI, or Anthropic)
- [ ] Channel account ready (WhatsApp Business or Telegram Bot Token)
- [ ] ElevenLabs API key (for voice features)
- [ ] Git installed (for backup automation)

## ⚙️ Core Setup (20 min)

### Gateway Configuration
- [ ] Run `openclaw configure` — set up model provider
- [ ] Add API key to `~/.bashrc` or `.env`
- [ ] Configure `openclaw.json` with identity (name, emoji, theme)
- [ ] Set up sub-agent allowlists if needed

### Channel Setup
**WhatsApp:**
- [ ] Run `openclaw gateway setup-whatsapp`
- [ ] Scan QR code with phone
- [ ] Test: send message, receive response
- [ ] Configure message policies (DM-only or group)

**Telegram:**
- [ ] Create bot via @BotFather
- [ ] Add bot token to config
- [ ] Disable privacy mode (BotFather → /setprivacy → Disable)
- [ ] Test: send /start, receive response

## 🔊 Voice Features (15 min)

- [ ] Add ElevenLabs API key to config
- [ ] Choose voice (Jessica recommended)
- [ ] Set `talk.voiceId` and `talk.apiKey`
- [ ] Install ffmpeg: `sudo apt install ffmpeg`
- [ ] Test TTS: send voice note
- [ ] Test STT: receive voice note → transcription

## 🧠 Personality Setup (10 min)

- [ ] Create/edit SOUL.md — personality & tone
- [ ] Create/edit USER.md — client info & preferences
- [ ] Create AGENTS.md — operating rules
- [ ] Test personality loads correctly

## ✅ Testing Checklist (10 min)

- [ ] Send message → Bot responds
- [ ] Send voice note → Transcribed + responds
- [ ] Bot sends voice → TTS works
- [ ] Memory works → Bot remembers previous context
- [ ] Channel reconnects after gateway restart

## 🔧 Common Issues & Fixes

| Issue | Fix |
|-------|-----|
| Bot doesn't respond on WhatsApp | Restart gateway: `openclaw gateway restart` |
| Voice notes fail | Check ffmpeg installed: `which ffmpeg` |
| "Model not found" error | Verify API key and model name in config |
| Bot doesn't receive group messages | Check privacy mode disabled, add to allowlist |
| Gateway won't start | Check port 18789 not in use: `lsof -i :18789` |
| Slow responses | Switch to faster model (GPT-4o-mini for simple tasks) |

## ⭐ Optional Extras (+R500-1000)

- [ ] MetaClaw installation (self-improving agent) — +1hr
- [ ] Custom dashboard/landing page — +2hr
- [ ] Cron job scheduling (automated daily tasks) — +30min
- [ ] Multi-channel setup (WhatsApp + Telegram) — +30min
- [ ] Custom sub-agent creation — +1hr per agent

## 📦 Deliverables

- [ ] Working bot on specified channel
- [ ] Voice features configured (if purchased)
- [ ] Personality files customized
- [ ] Setup documentation provided
- [ ] 30-day support via Fiverr messages

---

**Total Setup Time:** 60-90 minutes (basic) / 2-3 hours (full voice + extras)

*© Zuri — Chomi AI Agent Platform | South Africa 🇿🇦*
