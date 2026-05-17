#!/bin/bash
# 🦞 CHOMI VOICE — Quick install script
# Voice/audio for Chomi 2.0

echo "🦞 Installing Chomi Voice..."

# Check if ElevenLabs is already configured
if grep -q "ELEVENLABS_API_KEY" ~/.bashrc 2>/dev/null; then
    echo "✅ ElevenLabs API key found in ~/.bashrc"
else
    echo "⚠️ ElevenLabs API key not found"
    echo "Please add your ElevenLabs API key to ~/.bashrc:"
    echo 'export ELEVENLABS_API_KEY="your-key-here"'
fi

# Check if Whisper is installed
if command -v whisper &> /dev/null; then
    echo "✅ Whisper already installed"
else
    echo "📦 Installing Whisper..."
    pip install openai-whisper
fi

# Create voice wrapper script
cat > ~/.local/bin/chomi-speak << 'SPEAK'
#!/bin/bash
# Chomi speak wrapper
# Usage: chomi-speak "Hello, I'm Chomi"

TEXT="$1"
VOICE_ID="cgSgspJ2msm6clMCkdW9"  # Jessica voice

if [ -z "$ELEVENLABS_API_KEY" ]; then
    echo "❌ ELEVENLABS_API_KEY not set"
    exit 1
fi

# Generate voice
curl -s -X POST \
  https://api.elevenlabs.io/v1/text-to-speech/$VOICE_ID \
  -H "xi-api-key: $ELEVENLABS_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"text\":\"$TEXT\",\"model_id\":\"eleven_turbo_v2\"}" \
  -o /tmp/chomi-speech.mp3

# Play voice (if mpg123 is available)
if command -v mpg123 &> /dev/null; then
    mpg123 /tmp/chomi-speech.mp3 2>/dev/null
elif command -v ffplay &> /dev/null; then
    ffplay -nodisp -autoexit /tmp/chomi-speech.mp3 2>/dev/null
else
    echo "⚠️ No audio player found. Audio saved to /tmp/chomi-speech.mp3"
fi
SPEAK
chmod +x ~/.local/bin/chomi-speak

# Create voice listen wrapper
cat > ~/.local/bin/chomi-listen << 'LISTEN'
#!/bin/bash
# Chomi listen wrapper
# Usage: chomi-listen --timeout 30

TIMEOUT="${1:-30}"

# Record audio
ffmpeg -f alsa -i default -t $TIMEOUT -ar 16000 -ac 1 /tmp/chomi-listen.wav 2>/dev/null

# Transcribe
whisper /tmp/chomi-listen.wav --model tiny --language en --output_format txt --output_dir /tmp 2>/dev/null

# Output transcript
cat /tmp/chomi-listen.txt 2>/dev/null
LISTEN
chmod +x ~/.local/bin/chomi-listen

echo "✅ Chomi Voice ready!"
echo ""
echo "Usage:"
echo "  chomi-speak 'Hello, I am Chomi'"
echo "  chomi-listen --timeout 30"
