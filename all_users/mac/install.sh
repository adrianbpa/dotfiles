#!/bin/bash

set -xeuo pipefail

die() { echo "ERROR: $*" 1>&2 ; exit 1; }

ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bashrc ~/.bashrc

