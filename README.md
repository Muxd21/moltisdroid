# Moltis

Personal AI gateway for Termux.

## ⚡ Quick Start

**One-liner (Install & Setup):**
```bash
curl -sL https://github.com/Muxd21/moltisdroid/releases/latest/download/moltis-musl-arm64.tar.gz | tar -xz && chmod +x moltis-termux/moltis && mv moltis-termux/moltis $PREFIX/bin/ && rm -rf moltis-termux
```

**Run:**
```bash
moltis
```

---

## 🚀 Installation

### Automated Script
```bash
bash <(curl -sL https://raw.githubusercontent.com/Muxd21/moltisdroid/master/install.sh)
```

## 🛠️ Build Specs

- **Architecture:** Native ARM64 (aarch64)
- **Target:** `aarch64-unknown-linux-musl` (Static)
- **Host:** `ubuntu-24.04-arm` (GitHub Native ARM Runner)
- **Linking:** Zero dependencies, works on all Android versions without proot.

Auto-syncs 4x daily with official [moltis-org/moltis](https://github.com/moltis-org/moltis) releases.

© 2026 Muxd21 | Powered by Moltis
