# Moltis

Personal AI gateway.

## ⚡ Quick Start (Termux)

**One-liner:**
```bash
curl -sL https://github.com/Muxd21/moltisdroid/releases/latest/download/moltis-musl-arm64.tar.gz | tar -xz && chmod +x moltis-termux/moltis && mv moltis-termux/moltis $PREFIX/bin/ && rm -rf moltis-termux
```

**Starter:**
```bash
moltis
```

---

## 🚀 Installation Options

### 1. Static Musl (Recommended for Termux)

Statically linked with musl. Zero dependencies, works on any Android ARM64.

```bash
bash <(curl -sL https://raw.githubusercontent.com/Muxd21/moltisdroid/master/install.sh)
```

### 2. Native Bionic (Elite)

Linked directly against Android's native Bionic libc. Maximum performance.

```bash
bash <(curl -sL https://raw.githubusercontent.com/Muxd21/moltisdroid/master/install-bionic.sh)
```

---

## 🛸 The Command Center

Once installed, use the Elite Launcher:

```bash
./claw.sh
```

**What it does:**
- 🛰️ **Auto-Network Discovery:** Detects Tailscale & Local IPs
- 💻 **Secure Shell:** Starts sshd on port 2222
- 🧠 **AI Federation:** Launches Moltis Dashboard (3000) and Gateway (18789)
- 🔗 **Live Links:** Generates clickable links for your phone IP

---

## 📱 Visual Hub

Manage agents and tools: https://muxd21.github.io/moltisdroid/

---

## 🛠️ Build Infrastructure

| Component | Details |
|-----------|---------|
| **Runner** | ubuntu-24.04-arm (Native ARM64) |
| **Target 1** | aarch64-unknown-linux-musl (Static) |
| **Target 2** | aarch64-linux-android (Bionic) |
| **Schedule** | 4x daily (00:00, 06:00, 12:00, 18:00 UTC) |

Auto-builds sync with [moltis-org/moltis](https://github.com/moltis-org/moltis) releases.

---

## Manual Download

1. Go to [Releases](https://github.com/Muxd21/moltisdroid/releases)
2. Find latest `vX.Y.Z-termux` tag
3. Download `moltis-*-musl-arm64.tar.gz`

---

**© 2026 Muxd21** | Powered by Moltis & OpenClaw
