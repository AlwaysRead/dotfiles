. "$HOME/.local/share/../bin/env"

# Stop early if not running in an interactive shell
[[ $- != *i* ]] && return

# Load default Omarchy shell config (ignore errors)
source ~/.local/share/omarchy/default/bash/rc 2>/dev/null

# PATH
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
source "$HOME/.cargo/env" 2>/dev/null

# Aliases
alias y="yazi"
alias s="source"
alias windows="/home/chinmoy/.reboot-to-windows.sh"
alias q="exit"
alias c="clear"
alias nano="nvim"
alias update="sudo pacman -Syu"
alias upgrade="yay -Syu --noconfirm"

# Git Shortcuts
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gcl="git clone"
alias glog="git log --oneline --graph --decorate"

# History Settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups share_history

# Shell Behavior
setopt autocd auto_pushd pushd_ignore_dups correct interactivecomments

# Zinit Plugin Manager
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load Zinit Annexes
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

# Plugins: UI + Productivity
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light junegunn/fzf

# Completion System
autoload -U compinit
zmodload zsh/complist
compinit
setopt menu_complete completealiases

# Syntax highlighting
zinit wait lucid for zsh-users/zsh-syntax-highlighting

# Oh-My-Zsh plugin snippets
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/docker/docker.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh

# Zoxide + Starship
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# UI Styling (Colors)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[keyword]="fg=#ff5370"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#82aaff"
ZSH_HIGHLIGHT_STYLES[command]="fg=#c3e88d"
ZSH_HIGHLIGHT_STYLES[alias]="fg=#89ddff"
ZSH_HIGHLIGHT_STYLES[path]="fg=#f78c6c"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#ff5555,bold"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5e81ac"

# FZF
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border=rounded --margin=1 --padding=1 --preview-window=right:50%"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
bindkey '^R' fzf-history-widget

# Keybindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey -e
