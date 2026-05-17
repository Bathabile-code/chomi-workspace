#!/bin/bash
# 🦞 CHOMI VISION — Quick install script
# Visual intelligence for Chomi 2.0

echo "🦞 Installing Chomi Vision..."

# Check if we're on macOS or Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "✅ macOS detected"
    
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    # Install Peekaboo
    echo "📦 Installing Peekaboo..."
    brew tap steipete/tap
    brew install peekaboo
    
    # Verify installation
    if command -v peekaboo &> /dev/null; then
        echo "✅ Peekaboo installed successfully"
        peekaboo --version
    else
        echo "❌ Peekaboo installation failed"
        exit 1
    fi
    
    # Install canvas (browser automation)
    echo "📦 Installing canvas..."
    npm install -g @openclaw/canvas
    
    echo "✅ Chomi Vision installed on macOS"
    
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "✅ Linux detected"
    
    # For Linux, we'll use a different approach
    # Install dependencies
    sudo apt-get update
    sudo apt-get install -y scrot imagemagick
    
    # Create a simple screenshot tool
    cat > ~/.local/bin/chomi-screenshot << 'SCREENEOF'
#!/bin/bash
# Simple screenshot tool for Linux
scrot -u "$1"
SCREENEOF
    chmod +x ~/.local/bin/chomi-screenshot
    
    echo "✅ Chomi Vision installed on Linux"
    
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo "🦞 Chomi Vision ready!"
