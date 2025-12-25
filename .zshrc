# Load env
. "$HOME/.local/share/../bin/env"

# Interactive only
[[ $- != *i* ]] && return

# PATH
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
source "$HOME/.cargo/env" 2>/dev/null

# History
HISTFILE=~/.zsh_history
HISTSIZE=200000
SAVEHIST=200000
setopt appendhistory sharehistory histignorealldups histreduceblanks histverify extendedhistory
export HIST_STAMPS="yyyy-mm-dd"
alias history='fc -il 1 | sed "s/^[[:space:]]*//"'

# Completion
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# QoL
setopt autocd correct interactivecomments extendedglob pathdirs
bindkey '^H' backward-kill-word
bindkey '^R' fzf-history-widget

# Pager & colors
export LESS='-R'
export CLICOLOR=1

# Pretty man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Quick edit / reload
alias zshrc='nvim ~/.zshrc'
alias reload='source ~/.zshrc'

# Visuals
alias ls='eza --long --icons --group-directories-first --git --time-style=long-iso --header'
alias ll='eza --long --icons --group-directories-first --git --time-style=long-iso --header'
alias tree='eza --tree --icons --header'
alias grep='grep --color=auto'
alias c='clear'
alias q='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

# Git
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gcl='git clone'
alias gca='git commit --amend'
alias gd='git diff'
alias glg='git log --oneline --graph --decorate'

# Pacman
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq 2>/dev/null)'

# Dev helpers
alias n='nvim'
alias p='python'
alias serve='python -m http.server'
alias cpp='g++ -std=c++20 -O2 -Wall -Wextra'
alias venv='python -m venv .venv && source .venv/bin/activate'

# zoxide
eval "$(zoxide init zsh)"
alias cd='z'

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
