#!/bin/bash

# THIS IS AUTOMATICALLY CALLED BY GITHUB CODESPACES WHEN REBUILDING THE CONTAINER

set -euo pipefail

echo -e "Setting up dotfiles in GitHub Codespaces..."

DOTFILES_REPO_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CODESPACES_REPO_ROOT="/workspaces/dquality"

echo "Dotfiles repo root: $DOTFILES_REPO_ROOT"

pushd $DOTFILES_REPO_ROOT

$DOTFILES_REPO_ROOT/anomalo/linux/on_user_login.sh

# Install .NET 7
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-get update
apt-get install -y dotnet-sdk-7.0

apt update
apt install -y iputils-ping dnsutils nano || echo "Error while installing Debian packages"

$CODESPACES_REPO_ROOT/pipw sync
pip install poetry

chsh --shell /bin/bash

popd
