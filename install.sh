# THIS IS AUTOMATICALLY CALLED BY GITHUB CODESPACES WHEN REBUILDING THE CONTAINER

set -euo pipefail

echo -e "Setting up dotfiles in GitHub Codespaces..."

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_REPO_ROOT=$(realpath $SCRIPT_DIR/../../../)

echo "Script dir: $SCRIPT_DIR"
echo "Repo root: $DOTFILES_REPO_ROOT"

pushd $DOTFILES_REPO_ROOT

$DOTFILES_REPO_ROOT/all_users/all_OSs/on_user_login.sh

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

mkdir ~/.local_path || echo "~/.local_path already exists"
cp -a $DOTFILES_REPO_ROOT/anomalo/all_OSs/LOCAL_PATH/* ~/.local_path
chmod +x ~/.local_path/*

popd
