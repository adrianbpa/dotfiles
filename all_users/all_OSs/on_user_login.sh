#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_REPO_ROOT=$(realpath $SCRIPT_DIR/../../)

echo -e "RUNNING: On Startup for ALL USERS, ALL OSs"

pushd $DOTFILES_REPO_ROOT

[[ -d ".git" ]] && git pull origin main || echo "Error while git-pulling dotfiles."

export IS_MAC=false
[[ "$(uname -a)" == *Darwin* ]] && export IS_MAC=true

code --install-extension mhutchie.git-graph || echo "VS Code not installed"
code --install-extension shakram02.bash-beautify || echo "VS Code not installed"
code --install-extension samuelcolvin.jinjahtml || echo "VS Code not installed"
code --install-extension github.copilot || echo "VS Code not installed"
code --install-extension shaharkazaz.git-merger || echo "VS Code not installed"
code --install-extension ms-python.isort || echo "VS Code not installed"

curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

popd
