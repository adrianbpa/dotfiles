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
