#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTFILES_REPO_ROOT=$(realpath $SCRIPT_DIR/../../../)

echo -e "RUNNING: On Startup for ALL USERS, ALL OSs"

pushd $DOTFILES_REPO_ROOT

[[ -d ".git" ]] && git pull origin main

code --install-extension mhutchie.git-graph

popd
