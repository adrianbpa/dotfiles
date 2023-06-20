#!/bin/bash

set -euo pipefail

echo -e "Setting up dotfiles for Anomalo on Linux..."

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_REPO_ROOT=$(realpath $SCRIPT_DIR/../../)

pushd $DOTFILES_REPO_ROOT

source $DOTFILES_REPO_ROOT/all_users/all_OSs/on_user_login.sh

if [[ $IS_MAC == true ]]; then
    $DOTFILES_REPO_ROOT/all_users/mac/install.sh
    $DOTFILES_REPO_ROOT/all_users/all_OSs/on_user_login.sh
fi

if [[ -f ~/.bashrc ]]; then
    if [[ ! -f ~/.bashrc.bck ]]; then
        mv ~/.bashrc ~/.bashrc.bck
    else
        rm ~/.bashrc
    fi
fi

echo "# Dynamically generated bashrc from dotfiles" > ~/.bashrc && echo -e "\n\n\n" >> ~/.bashrc
cat $DOTFILES_REPO_ROOT/all_users/all_OSs/bashrc.sh >> ~/.bashrc && echo -e "\n\n\n" >> ~/.bashrc
cat $DOTFILES_REPO_ROOT/all_users/linux/bashrc.sh >> ~/.bashrc && echo -e "\n\n\n" >> ~/.bashrc
cat $DOTFILES_REPO_ROOT/anomalo/all_OSs/bashrc.sh >> ~/.bashrc && echo -e "\n\n\n" >> ~/.bashrc

# git config
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global pull.rebase true
git config --global push.default current

# Setup custom scripts
PATH_CUSTOM_SCRIPTS="$HOME/.local_path"
[[ ! -d "$PATH_CUSTOM_SCRIPTS" ]] && mkdir "$PATH_CUSTOM_SCRIPTS"
cp -a $DOTFILES_REPO_ROOT/anomalo/all_OSs/LOCAL_PATH/* "$PATH_CUSTOM_SCRIPTS"
chmod +x "$PATH_CUSTOM_SCRIPTS"/*

popd
