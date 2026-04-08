# Dotfiles — Mathieu

Complete config for my web/mobile dev environment on macOS (Apple Silicon).

## Repo contents

```
dotfiles/
├── .zshrc              → ~/.zshrc
├── Brewfile            → ~/Brewfile
├── ghostty.config      → ~/Library/Application Support/com.mitchellh.ghostty/config.ghostty
└── README.md
```

---

## Installation on a new machine

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
ln -s ~/dotfiles/Brewfile ~/Brewfile
ln -s ~/dotfiles/config.ghostty '/Users/mathieu/Library/Application Support/com.mitchellh.ghostty/config.ghostty'

# 6. Reload the shell
source ~/.zshrc
```

Symlinks ensure that the repo and the disk files are always automatically up to date — no need to copy files.

### Manual installations (outside Homebrew)

| App | Link |
|-----|------|
| Ghostty | [ghostty.org](https://ghostty.org) |

---

## Full Stack

### Terminal & shell

| Tool | Role |
|------|------|
| Ghostty | Fast, native GPU terminal for macOS (Zig + Swift) |
| Starship | Ultra-fast prompt written in Rust |
| zsh-autosuggestions | Gray suggestions based on history |
| zsh-syntax-highlighting | Syntax highlighting for commands |
| zoxide | Intelligent replacement for `cd` |
| fzf | Interactive fuzzy finder |
| eza | Replacement for `ls` with icons |
| bat | Replacement for `cat` with syntax highlighting |

### Node.js

| Tool | Role |
|------|------|
| fnm | Node version manager (Rust) |
| pnpm | Fast, disk space efficient package manager |

### Python

| Tool | Role |
|------|------|
| uv | All-in-one: Python versions + venvs + packages |

### Containers

| Tool | Role |
|------|------|
| Colima | Lightweight Linux VM for Docker (Docker Desktop alternative) |
| docker | Container CLI |
| docker-compose | Local orchestration |

### Editors

| Tool | Role |
|------|------|
| Antigravity | VS Code fork by Google + AI |
| Zed | Ultra-fast Rust editor |

### Dev Tools

| Tool | Role |
|------|------|
| Bruno | Open-source API client (Postman alternative) |
| TablePlus | Database GUI |
| DBeaver Community | Universal database tool / GUI |
| Responsively | Multi-screen testing |
| opencode | Command-line AI |
| Claude Code | Anthropic code agent |

### System productivity

| Tool | Role |
|------|------|
| Rectangle | Window management |
| AltTab | ⌥Tab Windows-style |
| Maccy | Clipboard history |
| Superwhisper | Offline voice dictation (privacy-first) |
| Bitwarden | Open-source password manager |
| AppCleaner | Clean uninstallation of apps |

---

## Essential Commands

### Homebrew

```bash
brew install <package>          # install a CLI tool
brew install --cask <app>       # install a GUI app
brew uninstall <package>        # uninstall
brew upgrade --greedy           # update everything (CLI + GUI)
brew search <name>              # search for a package
brew list                       # see everything installed
brew bundle dump --force        # update the Brewfile
brew bundle install             # restore from the Brewfile
brew bundle check               # check for differences
```

### fnm — Node version manager

```bash
fnm install --lts               # install the latest LTS
fnm install 22                  # install a specific version
fnm use 22                      # switch version
fnm list                        # installed versions
fnm default 22                  # set default version
```

### pnpm

```bash
pnpm install                    # install dependencies
pnpm add <package>              # add a package
pnpm add -D <package>           # add as a dev dependency
pnpm remove <package>           # remove a package
pnpm update                     # update packages
pnpm run <script>               # run a script from package.json
pnpm dlx <tool>                 # run a tool without installing it
```

### uv — Python

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

### Colima + Docker

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

### Git

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

### zoxide — smart navigation

```bash
z <keyword>                     # go to a frequent directory
zi                              # interactive selector by most visited directories
z -                             # previous directory
zoxide query -l                 # see all memorized directories
```

### fzf — interactive selector

```bash
Ctrl+R                          # search in history
Ctrl+T                          # file selector (inserts into command)
Alt+C                           # directory selector (interactive cd)
**<Tab>                         # fzf completion (e.g. cursor **<Tab>)
```

### eza — modern ls

```bash
eza                             # simple list with icons (eza config in .zshrc)
eza --long                      # detailed list
eza --long --all                # with hidden files
eza --tree --level=2            # tree view 2 levels deep
eza --tree --level=3 --git      # tree with git status
```

### bat — modern cat

```bash
bat <file>                      # display with syntax highlighting
bat <file> --plain              # without line numbers
bat *.json                      # multiple files
```

---

## Ghostty Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+↑` | Scroll up to previous prompt |
| `Ctrl+Shift+↓` | Scroll down to next prompt |
| `Cmd+T` | New tab |
| `Cmd+D` | Horizontal split |
| `Cmd+Shift+D` | Vertical split |
| `Cmd+W` | Close tab |


