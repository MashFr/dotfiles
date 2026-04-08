<div align="center">

# 🛠️ Dotfiles — Mathieu

**Complete configuration for my web/mobile dev environment on macOS (Apple Silicon).**

[![OS - macOS](https://img.shields.io/badge/OS-macOS_Apple_Silicon-black?logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![Shell - Zsh](https://img.shields.io/badge/Shell-Zsh-1E293B?logo=zsh&logoColor=white)](https://www.zsh.org/)
[![Terminal - Ghostty](https://img.shields.io/badge/Terminal-Ghostty-2d2d2d)](https://ghostty.org/)
[![Package Manager - Homebrew](https://img.shields.io/badge/Package_Manager-Homebrew-F2A65A?logo=homebrew&logoColor=black)](https://brew.sh/)

*This repository contains my "dotfiles"—the hidden configuration files that dictate how my system and development tools behave. By keeping these files in a Git repository, I can easily version control my settings, share them, and quickly restore my entire environment on a new machine.*

</div>

---

## 📂 Repository Contents

| File | Destination | Description |
| :--- | :--- | :--- |
| **`.zshrc`** | `~/.zshrc` | Zsh configuration & aliases |
| **`Brewfile`** | `~/Brewfile` | Homebrew dependencies list |
| **`config.ghostty`** | `~/Library/.../config.ghostty` | Ghostty terminal settings |
| **`README.md`** | `-` | This file |

---

## 🚀 Quick Setup (New Machine)

To install everything on a fresh macOS installation, execute the following commands in your terminal:

```bash
# 1. Xcode CLI tools
xcode-select --install

# 2. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Clone the repo
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# 4. Install everything from the Brewfile
brew bundle install --file=~/dotfiles/Brewfile

# 5. Create symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.Brewfile ~/.Brewfile
ln -s ~/dotfiles/config.ghostty '/Users/mathieu/Library/Application Support/com.mitchellh.ghostty/config.ghostty'

# 6. Reload the shell
source ~/.zshrc
```

> **Note:** Symlinks ensure that the repository and the disk files are always automatically up to date — no need to copy files manually.

### 📥 Manual Installations (Outside Homebrew)

* [**Ghostty**](https://ghostty.org) - Fast, native GPU terminal for macOS (Zig + Swift)

---

## 💻 Full Stack Overview

<details open>
<summary><b>🧑‍💻 Terminal & Shell</b></summary>

| Tool | Role |
| :--- | :--- |
| **Ghostty** | Fast, native GPU terminal for macOS |
| **Starship** | Ultra-fast prompt written in Rust |
| **zsh-autosuggestions** | Gray suggestions based on history |
| **zsh-syntax-highlighting**| Syntax highlighting for commands |
| **zoxide** | Intelligent replacement for `cd` |
| **fzf** | Interactive fuzzy finder |
| **eza** | Replacement for `ls` with icons |
| **bat** | Replacement for `cat` with syntax highlighting |

</details>

<details>
<summary><b>🌐 Node.js</b></summary>

| Tool | Role |
| :--- | :--- |
| **fnm** | Node version manager (Rust) |
| **pnpm** | Fast, disk space efficient package manager |

</details>

<details>
<summary><b>🐍 Python</b></summary>

| Tool | Role |
| :--- | :--- |
| **uv** | All-in-one: Python versions + venvs + packages |

</details>

<details>
<summary><b>🐳 Containers</b></summary>

| Tool | Role |
| :--- | :--- |
| **Colima** | Lightweight Linux VM for Docker (Docker Desktop alternative) |
| **docker** | Container CLI |
| **docker-compose** | Local orchestration |

</details>

<details>
<summary><b>📝 Editors</b></summary>

| Tool | Role |
| :--- | :--- |
| **Antigravity** | VS Code fork by Google + AI |
| **Zed** | Ultra-fast Rust editor |

</details>

<details>
<summary><b>🛠️ Dev Tools</b></summary>

| Tool | Role |
| :--- | :--- |
| **Bruno** | Open-source API client (Postman alternative) |
| **TablePlus** | Database GUI |
| **DBeaver Community** | Universal database tool / GUI |
| **Responsively** | Multi-screen testing |
| **opencode** | Command-line AI |
| **Claude Code** | Anthropic code agent |

</details>

<details>
<summary><b>⚡ System Productivity</b></summary>

| Tool | Role |
| :--- | :--- |
| **Rectangle** | Window management |
| **AltTab** | ⌥Tab Windows-style |
| **Maccy** | Clipboard history |
| **Superwhisper** | Offline voice dictation (privacy-first) |
| **Bitwarden** | Open-source password manager |
| **AppCleaner** | Clean uninstallation of apps |

</details>

---

## ⌨️ Essential Commands Cheat Sheet

<details>
<summary><b>🍺 Homebrew</b></summary>

```bash
brew install <package>            # install a CLI tool
brew install --cask <app>         # install a GUI app
brew uninstall <package>          # uninstall
brew upgrade --greedy             # update everything (CLI + GUI)
brew search <name>                # search for a package
brew list                         # see everything installed
brew bundle dump --global --force # update the .Brewfile
brew bundle install               # restore from the Brewfile
brew bundle check                 # check for differences
```
</details>

<details>
<summary><b>📦 Node.js (fnm & pnpm)</b></summary>

**fnm — Node version manager**
```bash
fnm install --lts               # install the latest LTS
fnm install 22                  # install a specific version
fnm use 22                      # switch version
fnm list                        # installed versions
fnm default 22                  # set default version
```

**pnpm**
```bash
pnpm install                    # install dependencies
pnpm add <package>              # add a package
pnpm add -D <package>           # add as a dev dependency
pnpm remove <package>           # remove a package
pnpm update                     # update packages
pnpm run <script>               # run a script from package.json
pnpm dlx <tool>                 # run a tool without installing it
```
</details>

<details>
<summary><b>🐍 Python (uv)</b></summary>

```bash
uv python install 3.13          # install a Python version
uv python list                  # available versions
uv init my-project              # create a new project
uv add <package>                # add a dependency
uv add --dev <package>          # add as a dev dependency
uv remove <package>             # remove a dependency
uv run script.py                # run a script (auto venv)
uv sync                         # sync venv with uv.lock
uvx <tool>                      # run a tool without installing it
uvx ruff check .                # lint
uvx ruff format .               # format
```
</details>

<details>
<summary><b>🚀 Docker & Colima</b></summary>

```bash
colima start                    # start the Linux VM
colima stop                     # stop
colima status                   # check status
colima delete                   # delete the VM (starts from scratch)

docker ps                       # running containers
docker ps -a                    # all containers
docker images                   # available images
docker build -t my-app .        # build an image
docker run -p 3000:3000 my-app  # run a container
docker logs <container>         # view logs
docker exec -it <container> sh  # enter a container
docker stop <container>         # stop a container
docker rm <container>           # remove a container
docker rmi <image>              # remove an image
docker system prune             # clean up everything unused

docker compose up -d            # run in background
docker compose down             # stop
docker compose logs -f          # tail logs live
docker compose ps               # service status
```
</details>

<details>
<summary><b>🌲 Git</b></summary>

```bash
git init                        # initialize a repo
git clone <url>                 # clone a repo
git status                      # repo status
git add .                       # stage all changes
git add <file>                  # stage a specific file
git commit -m "message"         # commit
git push                        # push to remote
git push -u origin main         # first push
git pull                        # fetch and merge changes
git fetch                       # fetch without merging
git log --oneline               # compact history
git diff                        # view unstaged changes
git stash                       # stash changes
git stash pop                   # restore stashed changes

git branch <name>               # create a branch
git checkout <branch>           # switch branch
git checkout -b <branch>        # create and switch branch
git merge <branch>              # merge a branch
git rebase <branch>             # rebase
git branch -d <branch>          # delete a branch
```
</details>

<details>
<summary><b>🧭 Navigation & Search (zoxide, fzf)</b></summary>

**zoxide — smart navigation**
```bash
z <keyword>                     # go to a frequent directory
zi                              # interactive selector by most visited directories
z -                             # previous directory
zoxide query -l                 # see all memorized directories
```

**fzf — interactive selector**
```bash
Ctrl+R                          # search in history
Ctrl+T                          # file selector (inserts into command)
Alt+C                           # directory selector (interactive cd)
**<Tab>                         # fzf completion (e.g. cursor **<Tab>)
```
</details>

<details>
<summary><b>✨ Terminal Utilities (eza, bat)</b></summary>

**eza — modern ls**
```bash
eza                             # simple list with icons (eza config in .zshrc)
eza --long                      # detailed list
eza --long --all                # with hidden files
eza --tree --level=2            # tree view 2 levels deep
eza --tree --level=3 --git      # tree with git status
```

**bat — modern cat**
```bash
bat <file>                      # display with syntax highlighting
bat <file> --plain              # without line numbers
bat *.json                      # multiple files
```
</details>

---

## 👻 Ghostty Shortcuts

| Keybinding | Action |
| :--- | :--- |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>↑</kbd> | Scroll up to previous prompt |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>↓</kbd> | Scroll down to next prompt |
| <kbd>Cmd</kbd> + <kbd>T</kbd> | New tab |
| <kbd>Cmd</kbd> + <kbd>D</kbd> | Horizontal split |
| <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>D</kbd> | Vertical split |
| <kbd>Cmd</kbd> + <kbd>W</kbd> | Close tab |

<br>

<div align="center">
  <i>Built with ❤️ for rapid onboarding</i>
</div>
