# 🔧 Dotfiles

My personal macOS configuration.

## Prerequisites

Before installation, you need:

1. **Command Line Tools**
   ```bash
   xcode-select --install
   ```

2. **Homebrew**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Rosetta 2** (Apple Silicon only)
   ```bash
   softwareupdate --install-rosetta --agree-to-license
   ```

## Installation

```bash
git clone https://github.com/idkosilov/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash ./install
```
