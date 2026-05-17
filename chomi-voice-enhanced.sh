#!/bin/bash
# 🦞 CHOMI VOICE ENHANCED — Full voice capabilities
# Uses ElevenLabs (already configured) + Whisper

echo "🦞 Enhancing Chomi Voice..."

# Check ElevenLabs config
if grep -q "sk_c93cb636ce532579e3dcf3889bcb8481bbc98074f5cc4c55" ~/.openclaw/openclaw.json 2>/dev/null; then
    echo "✅ ElevenLabs API key found in OpenClaw config"
    export ELEVENLABS_API_KEY="sk_c93cb636ce532579e3dcf3889bcb8481bbc98074f5cc4c55"
else
    echo "❌ ElevenLabs API key not found"
    exit 1
fi

# Voice ID (Jessica)
VOICE_ID="cgSgspJ2msm6clMCkdW9"

echo "🎙️ Voice ID: $VOICE_ID (Jessica)"

# Test voice generation
echo "🧪 Testing voice generation..."
curl -s -X POST \
  https://api.elevenlabs.io/v1/text-to-speech/$VOICE_ID \
  -H "xi-api-key: $ELEVENLABS_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"text":"Hello, I am Chomi 2 point 0. The future of agentic development is here.","model_id":"eleven_turbo_v2","voice_settings":{"stability":0.5,"similarity_boost":0.5}}' \
  -o /tmp/chomi-test-voice.mp3

if [ -f /tmp/chomi-test-voice.mp3 ] && [ -s /tmp/chomi-test-voice.mp3 ]; then
    echo "✅ Voice test successful!"
    echo "📁 Audio saved to: /tmp/chomi-test-voice.mp3"
    
    # Try to play it
    if command -v ffplay &> /dev/null; then
        echo "🔊 Playing test voice..."
        ffplay -nodisp -autoexit /tmp/chomi-test-voice.mp3 2>/dev/null
    elif command -v mpg123 &> /dev/null; then
        echo "🔊 Playing test voice..."
        mpg123 /tmp/chomi-test-voice.mp3 2>/dev/null
    else
        echo "⚠️ No audio player found. Audio saved but not played."
    fi
else
    echo "❌ Voice test failed"
fi

# Create enhanced voice wrapper
cat > ~/.local/bin/chomi-speak-enhanced << 'SPEAK'
#!/bin/bash
# Enhanced Chomi speak
# Usage: chomi-speak-enhanced "Hello, I am Chomi"

TEXT="$1"
VOICE_ID="cgSgspJ2msm6clMCkdW9"
API_KEY="sk_c93cb636ce532579e3dcf3889bcb8481bbc98074f5cc4c55"

if [ -z "$TEXT" ]; then
    echo "❌ Usage: chomi-speak-enhanced 'Your text here'"
    exit 1
fi

echo "🎙️ Generating voice..."

curl -s -X POST \
  https://api.elevenlabs.io/v1/text-to-speech/$VOICE_ID \
  -H "xi-api-key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"text\":\"$TEXT\",\"model_id\":\"eleven_turbo_v2\",\"voice_settings\":{\"stability\":0.5,\"similarity_boost\":0.5}}" \
  -o /tmp/chomi-speech.mp3

if [ -f /tmp/chomi-speech.mp3 ] && [ -s /tmp/chomi-speech.mp3 ]; then
    echo "✅ Voice generated!"
    
    # Play voice
    if command -v ffplay &> /dev/null; then
        ffplay -nodisp -autoexit /tmp/chomi-speech.mp3 2>/dev/null
    elif command -v mpg123 &> /dev/null; then
        mpg123 /tmp/chomi-speech.mp3 2>/dev/null
    fi
else
    echo "❌ Voice generation failed"
fi
SPEAK
chmod +x ~/.local/bin/chomi-speak-enhanced

# Create voice for demo script
cat > ~/.local/bin/chomi-demo-voice << 'DEMO'
#!/bin/bash
# Chomi demo voice — pre-recorded phrases for EP02

PHRASE="$1"
API_KEY="sk_c93cb636ce532579e3dcf3889bcb8481bbc98074f5cc4c55"
VOICE_ID="cgSgspJ2msm6clMCkdW9"

case "$PHRASE" in
    "ask")
        TEXT="I need ServiceNow credentials, email access, and API keys."
        ;;
    "see")
        TEXT="I see the sys_email table. I'll create a bridge."
        ;;
    "done")
        TEXT="Done. 20 emails ingested, zero duplicates."
        ;;
    "learn")
        TEXT="I've learned from this. Next time will be faster."
        ;;
    "intro")
        TEXT="Hello, I am Chomi 2 point 0. The future of agentic development is here."
        ;;
    *)
        TEXT="$PHRASE"
        ;;
esac

echo "🎙️ $TEXT"

curl -s -X POST \
  https://api.elevenlabs.io/v1/text-to-speech/$VOICE_ID \
  -H "xi-api-key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"text\":\"$TEXT\",\"model_id\":\"eleven_turbo_v2\",\"voice_settings\":{\"stability\":0.5,\"similarity_boost\":0.5}}" \
  -o /tmp/chomi-demo.mp3

if [ -f /tmp/chomi-demo.mp3 ] && [ -s /tmp/chomi-demo.mp3 ]; then
    if command -v ffplay &> /dev/null; then
        ffplay -nodisp -autoexit /tmp/chomi-demo.mp3 2>/dev/null
    elif command -v mpg123 &> /dev/null; then
        mpg123 /tmp/chomi-demo.mp3 2>/dev/null
    fi
fi
DEMO
chmod +x ~/.local/bin/chomi-demo-voice

echo ""
echo "✅ Chomi Voice Enhanced!"
echo ""
echo "Usage:"
echo "  chomi-speak-enhanced 'Hello, I am Chomi'"
echo "  chomi-demo-voice ask       # 'I need credentials...'"
echo "  chomi-demo-voice see       # 'I see the sys_email table...'"
echo "  chomi-demo-voice done      # 'Done. 20 emails...'"
echo "  chomi-demo-voice learn     # 'I've learned...'"
echo "  chomi-demo-voice intro     # 'Hello, I am Chomi 2.0...'"
echo ""