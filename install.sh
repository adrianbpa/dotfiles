# prezto & base config
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" 2> /dev/null || (cd "${ZDOTDIR:-$HOME}/.zprezto" ; git pull)

ln -sf "${ZDOTDIR:-$HOME}/.zprezto/zlogin" $HOME/.zlogin
ln -sf "${ZDOTDIR:-$HOME}/.zprezto/zshenv" $HOME/.zshenv

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

ln -sf ${BASEDIR}/linux/personal_config/files/p10k.zsh.sh ${HOME}/.p10k.zsh
ln -sf ${BASEDIR}/linux/personal_config/files/zpreztorc.sh ${HOME}/.zpreztorc
ln -sf ${BASEDIR}/linux/personal_config/files/zshrc.sh ${HOME}/.zshrc
ln -sf ${BASEDIR}/linux/personal_config/files/bashrc.sh ${HOME}/.bashrc
chmod +x ${HOME}/.bashrc

mkdir ~/.local_path
cp -a ${BASEDIR}/linux/LOCAL_PATH/* ~/.local_path

curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
echo 'source ~/.git-prompt.sh' >> ~/.bashrc

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git --branch 0.29.0 ~/.fzf
~/.fzf/install --all --no-bash

#chsh --shell /usr/bin/zsh
chsh --shell /bin/bash

# git config
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global pull.rebase true
git config --global push.default current

apt update -y
apt install nano -y
apt install -y bash-completion
apt install -y redis-tools
