# === ZSH ===
# Initialize zsh completion system
autoload -Uz compinit && compinit
# plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# eza config
export EZA_ICONS_AUTO=1

# === TOOLS DEV ===

# fnm : node manager version
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# uv : python manager version
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# === SOFT ===

# Added by Antigravity
export PATH="/Users/mathieu/.antigravity/antigravity/bin:$PATH"

# Pi-coding-agent
[ -f ~/dotfiles/.secrets ] && source ~/dotfiles/.secrets

# Starship alway in the end
eval "$(starship init zsh)"


