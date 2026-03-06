#!/bin/bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${CYAN}"
echo "    __  ___      ____  _     "
echo "   /  |/  /___  / / /_(_)____"
echo "  / /|_/ / __ \/ / __/ / ___/"
echo " / /  / / /_/ / / /_/ (__  ) "
echo "/_/  /_/\____/_/\__/_/____/  "
echo -e "      TERMUX EDITION${NC}\n"

if [ ! -d "$PREFIX" ]; then
    echo -e "${RED}❌ Error: This script must be run inside Termux.${NC}"
    exit 1
fi

echo -e "${YELLOW}🔍 Detecting latest release...${NC}"
LATEST=$(curl -s https://api.github.com/repos/moltis-org/moltis/releases/latest | jq -r '.tag_name')
VERSION="${LATEST#v}"

DOWNLOAD_URL="https://github.com/Muxd21/moltisdroid/releases/download/${LATEST}-termux/moltis-termux-aarch64.tar.gz"

echo -e "${CYAN}📥 Downloading Moltis v${VERSION}...${NC}"
if ! curl -sL "$DOWNLOAD_URL" -o "moltis.tar.gz"; then
    echo -e "${RED}❌ Download failed!${NC}"
    echo "Check status at: https://github.com/Muxd21/moltisdroid/releases"
    exit 1
fi

echo -e "${YELLOW}📦 Extracting...${NC}"
tar -xzf moltis.tar.gz

echo -e "${YELLOW}🔧 Installing binary...${NC}"
mv moltis-termux/moltis "$PREFIX/bin/moltis"
chmod +x "$PREFIX/bin/moltis"

echo -e "${YELLOW}🧹 Cleaning up...${NC}"
rm -rf moltis-termux moltis.tar.gz

echo -e "${CYAN}🚀 Generating Elite Launcher (claw.sh)...${NC}"
cat > claw.sh << 'EOF'
#!/bin/bash
# Moltis Elite Launcher

# 🌈 Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

# 🌐 Network Detection
TS_IP=$(tailscale ip -4 2>/dev/null || echo "Not Connected")
LOCAL_IP=$(ip addr show wlan0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1 || echo "127.0.0.1")

echo -e "${CYAN}🛸 Moltis Operational Status${NC}"
echo -e "---------------------------------"
echo -e "🧠 Build: ${WHITE}Native Android (Zero-Proot)${NC}"
echo -e "🛰️ Tailscale: ${GREEN}${TS_IP}${NC}"
echo -e "🏠 Local IP: ${GREEN}${LOCAL_IP}${NC}"
echo -e "---------------------------------\n"

# 🛠️ Start Services
echo -e "${YELLOW}⚙️ Starting SSHd (Port 2222)...${NC}"
sshd -p 2222 2>/dev/null || true

echo -e "${YELLOW}⚙️ Starting Moltis Hub...${NC}"
moltis serve --host 0.0.0.0 --port 3000 > /dev/null 2>&1 &

echo -e "${GREEN}✅ System Operational!${NC}"
echo -e "\n🌍 ${WHITE}Access Dashboard:${NC}"
echo -e "   🔗 http://${LOCAL_IP}:3000"
[ "$TS_IP" != "Not Connected" ] && echo -e "   🔗 http://${TS_IP}:3000 (Tailscale)"
echo -e "\n💻 ${WHITE}SSH Command:${NC}"
echo -e "   ssh -p 2222 root@${LOCAL_IP}"
echo -e "\n--- Keep this terminal open or run in background ---"
wait
EOF

chmod +x claw.sh

echo -e "${GREEN}✨ Installation Complete!${NC}"
echo -e "Run ${WHITE}./claw.sh${NC} to launch your AI Command Center."
