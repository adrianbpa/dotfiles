# BASHRC FOR ALL USERS, LINUX

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# SETUP REQUIRED SOFTWARE IN LINUX (except GitHub Codespaces)
if [[ "${CODESPACES:-""}" != "true" ]]; then
    if [[ ! $(command -v k9s) ]]; then
        export PATH_K9S=/opt/k9s-0.27.3
        [[ ! -d "$PATH_K9S" ]] && echo "ERROR: Missing k9s in ${PATH_K9S} - Please install from https://github.com/derailed/k9s/releases"
        export PATH=$PATH:$PATH_K9S
    fi

    export PATH_DBEAVER="/opt/dbeaver"
    [[ ! -d "$PATH_DBEAVER" ]] && echo "ERROR: Missing DBeaver in ${PATH_DBEAVER} - Please install from https://dbeaver.io/download/"
    export PATH=$PATH:$PATH_DBEAVER

    export PATH_RIDER="/opt/JetBrainsRider-2022.3.2/bin"
    [[ ! -d "$PATH_RIDER" ]] && echo "ERROR: Missing JetBrains Rider in ${PATH_RIDER} - Please install from https://www.jetbrains.com/rider/download/"
    export PATH=$PATH:$PATH_RIDER

    export PATH_JB_GW="/opt/JetBrainsGateway-231.8109.187/bin"
    [[ ! -d "$PATH_JB_GW" ]] && echo "ERROR: Missing JetBrains Gateway in ${PATH_RIDER} - Please install from https://www.jetbrains.com/remote-development/gateway/"
    export PATH=$PATH:$PATH_JB_GW

    export DOTNET_ROOT="/opt/dotnet-7.0"
    [[ ! -d "$DOTNET_ROOT" ]] && echo "ERROR: Missing .NET in ${DOTNET_ROOT} - Please install from https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual?source=recommendations"
    export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
fi

source ~/.git-prompt.sh

alias dum="du -h --max-depth=1"
