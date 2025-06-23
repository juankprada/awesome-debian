#!/usr/bin/env bash

# Install Xmonad dependencies
sudo apt install haskell-stack libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev xmobar

# Prepare directories
mkdir -p ~/.config/xmonad && cd ~/.config/xmonad

git clone https://github.com/xmonad/xmonad
git clone https://github.com/xmonad/xmonad-contrib

# make sure haskell stack is up to date
stack upgrade

if [ -f "stack.yml" ]; then
	echo "Stack already exists. Skipping"
else
	stack init
fi

stack install

echo "Xmonad was built successfully"
