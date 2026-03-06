# Moltis Termux Edition

Personal AI gateway compiled natively for Android/Termux.

## ⚡ Quick Start

### Option 1: One-liner
Download and install instantly:
```bash
curl -sL https://github.com/Muxd21/moltisdroid/releases/latest/download/moltis-termux-aarch64.tar.gz | tar -xz && chmod +x moltis-termux/moltis && mv moltis-termux/moltis $PREFIX/bin/ && rm -rf moltis-termux
```

### Option 2: Automated Script
Downloads the binary and generates an advanced `claw.sh` launcher:
```bash
bash <(curl -sL https://raw.githubusercontent.com/Muxd21/moltisdroid/master/install.sh)
```

---

## 🛸 The Command Center

If you used the automated script, you can launch the full stack with:
```bash
./claw.sh
```

**What it does:**
- 🛰️ **Auto-Network Discovery:** Detects Tailscale & Local IPs
- 💻 **Secure Shell:** Starts sshd on port 2222
- 🧠 **AI Federation:** Launches Moltis Dashboard on port 3000
- 🔗 **Live Links:** Generates clickable links for your phone IP

## 📱 Visual Hub
Monitor and manage agents: https://muxd21.github.io/moltisdroid/

## 🛠️ Build Specs
- **Architecture:** Native ARM64 (`aarch64-linux-android`)
- **Performance:** Direct linkage to Android's libc (Bionic), bypassing proot overhead.
- **Syncs 4x daily** with upstream [moltis-org/moltis](https://github.com/moltis-org/moltis).

**© 2026 Muxd21** | Powered by Moltis
