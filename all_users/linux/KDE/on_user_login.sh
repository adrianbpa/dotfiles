#!/bin/bash

echo -e "RUNNING: On Startup for ALL USERS, LINUX"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_REPO_ROOT=$(realpath $SCRIPT_DIR/../../../)

echo "Script dir: $SCRIPT_DIR"
echo "Repo root: $DOTFILES_REPO_ROOT"

pushd $DOTFILES_REPO_ROOT

$DOTFILES_REPO_ROOT/all_users/on_

git pull origin master

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

popd
