alias ll='ls $LS_OPTIONS -lah'
alias dum="du -h --max-depth=1"
alias ksandbox="kubectl --context arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging --namespace sandbox-a6h9"
alias kdemo="kubectl --context arn:aws:eks:us-west-2:580663733917:cluster/anomalo-staging --namespace demo"
alias kstaging="kubectl --context arn:aws:eks:us-west-1:580663733917:cluster/anomalo-staging-us-west-1 --namespace staging-5fa9"
alias k="ksandbox"
alias ksandbox_all='clear && ksandbox get all,ing -o wide'
alias kstaging_all='clear && kstaging get all,ing -o wide'

export PS1="\[\033[38;5;20m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;1m\]\\$>\[$(tput sgr0)\] \[$(tput sgr0)\]"


## Print nickname for git/hg/bzr/svn version control in CWD
## Optional $1 of format string for printf, default "(%s) "
function be_get_branch {
  local dir="$PWD"
  local vcs
  local nick
  while [[ "$dir" != "/" ]]; do
    for vcs in git hg svn bzr; do
      if [[ -d "$dir/.$vcs" ]] && hash "$vcs" &>/dev/null; then
        case "$vcs" in
          git) __git_ps1 "${1:-(%s) }"; return;;
          hg) nick=$(hg branch 2>/dev/null);;
          svn) nick=$(svn info 2>/dev/null\
                | grep -e '^Repository Root:'\
                | sed -e 's#.*/##');;
          bzr)
            local conf="${dir}/.bzr/branch/branch.conf" # normal branch
            [[ -f "$conf" ]] && nick=$(grep -E '^nickname =' "$conf" | cut -d' ' -f 3)
            conf="${dir}/.bzr/branch/location" # colo/lightweight branch
            [[ -z "$nick" ]] && [[ -f "$conf" ]] && nick="$(basename "$(< $conf)")"
            [[ -z "$nick" ]] && nick="$(basename "$(readlink -f "$dir")")";;
        esac
        [[ -n "$nick" ]] && printf "${1:-(%s) }" "$nick"
        return 0
      fi
    done
    dir="$(dirname "$dir")"
  done
}

## Add branch to PS1 (based on $PS1 or $1), formatted as $2
export GIT_PS1_SHOWDIRTYSTATE=yes
#export PS1="\$(be_get_branch "$2")${PS1}";

# Faster (1ms vs 5ms) than /usr/bin/dirname
function dirname() {
  local dir="${1%${1##*/}}"
  "${dir:=./}" != "/" && dir="${dir%?}"
  echo "$dir"
}

PATH=$PATH:~/.local_path
