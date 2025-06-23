#!/usr/bin/env bash

# Ensure Development directory exists
mkdir -p $HOME/Development

git clone https://gitlab.com/juankprada/dotfiles.git $HOME/Development/dotfiles/ 

pushd $HOME/Development/dotfiles/

WORKING_DIR=${PWD}

bash ./install.sh

popd
