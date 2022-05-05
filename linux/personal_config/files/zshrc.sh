# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Term color
export TERM=xterm-256color

# Platform-specific stuff
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LANG='en_US.UTF-8'

# Less
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Pretty-print JSON files
json() {
  [ -n "$1" ] || return
  jsonlint "$1" | jq .
}

# Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias
alias ll="ls -lah"
alias k="clear && kubectl"
alias ka="clear && kubectl get all,ing -o wide"

# Snappy escape
export KEYTIMEOUT=1

# mappings
bindkey '^K' kill-whole-line
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd "^[" vi-add-next

# History
setopt INC_APPEND_HISTORY        # Share history between all sessions.

HISTSIZE=50000                   # The maximum number of events to save in the internal history.
SAVEHIST=50000                   # The maximum number of events to save in the history file.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
