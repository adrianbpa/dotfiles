#!/bin/bash

set -xeuo pipefail

die() { echo "ERROR: $*" 1>&2 ; exit 1; }

DOTFILES_REPO_ROOT=$(realpath $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/../../ )

rm ~/.bash_profile || echo ""
ln -s $DOTFILES_REPO_ROOT/all_users/mac/bash_profile ~/.bash_profile

