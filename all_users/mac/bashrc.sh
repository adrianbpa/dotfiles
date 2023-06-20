# BASHRC FOR ALL USERS, MAC

PATH_ASDF_SHIMS="$HOME/.asdf/shims"
[[ -d "$PATH_ASDF_SHIMS" ]] && export PATH=$PATH:$PATH_ASDF_SHIMS

alias dum="du -h -d 1"

source ~/.docker/init-bash.sh || true # Added by Docker Desktop
