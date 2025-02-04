#!/usr/bin/env bash

# Install Xmonad dependencies
sudo apt install haskell-stack libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev xmobar

# Prepare directories
mkdir -p ~/.config/xmonad && cd ~/.config/xmonad

git clone https://github.com/xmonad/xmonad
git clone https://github.com/xmonad/xmonad-contrib

# make sure haskell stack is up to date
stack upgrade

is_new_setup() {
    if [ -d ./stack.yml ]; then
	return 0
    else
	return 1
    fi
}

if is_new_setup; then
    stack init
fi

stack install

echo "Xmonad was built successfully"
