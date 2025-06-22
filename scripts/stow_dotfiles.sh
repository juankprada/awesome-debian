#!/usr/bin/env bash

# Ensure Development directory exists
mkdir -p $HOME/Development

git clone git@gitlab.com:juankprada/dotfiles.git $HOME/Development/dotfiles/ 

pushd $HOME/Development/dotfiles/

WORKING_DIR=${PWD}

echo ">>> Backing up existing files"
BASHRC_FILE=$HOME/.bashrc
if [ -f "$BASHRC_FILE" ]; then
    
	timestamp=$(date +"%Y%m%d%H%M")
	backup_file=".bashrc.${timestamp}.bk"
	echo ">>> Backing up .bashrc file -> ${backup_file}"
    mv $BASHRC_FILE ~/"$backup_file"
fi

stow -R ./ --dotfiles --ignore='.DS_Store'

popd
