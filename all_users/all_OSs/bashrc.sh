# BASHRC FOR ALL USERS, ALL OSs

alias ll='ls $LS_OPTIONS -lah'

# Term color
export TERM=xterm-256color

# Platform-specific stuff
export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'
export LANG='en_US.UTF-8'

# Less
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

export PS1="\[\033[38;5;20m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;1m\]\\$>\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias aws_whoami="aws sts get-caller-identity"

export DOTFILES_REPO_ROOT="/workspaces/.codespaces/.persistedshare/dotfiles"
[[ ! -d "${DOTFILES_REPO_ROOT}" && -d ~/repos/dotfiles ]] && export DOTFILES_REPO_ROOT="$(realpath ~/repos/dotfiles)"
[[ ! -d "${DOTFILES_REPO_ROOT}" ]] && export DOTFILES_REPO_ROOT="$(realpath ~/.adrianbpa.dotfiles)"

[[ -d "${HOME}/.asdf/bin" ]] && export PATH="${PATH}:${HOME}/.asdf/bin"
[[ -d "${HOME}/.asdf/shims" ]] && export PATH="${PATH}:${HOME}/.asdf/shims"

source "${DOTFILES_REPO_ROOT}/all_users/all_OSs/git-completion.bash"
