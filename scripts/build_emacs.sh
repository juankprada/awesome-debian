#!/usr/bin/env bash

local_repo=$HOME/Development/emacs

check_emacs_cloned() {
    if [ -d $local_repo ]; then
	echo 'Emacs repository already exists at $(local_repo)'
        return 1
    else
        return 0
    fi
}

# install build dependencies
sudo apt build-dep emacs -y
sudo apt install -y libtree-sitter-dev

# Setup checkout directory
mkdir -p $HOME/Development

cd $HOME/Development

if check_emacs_cloned; then
    git clone https://github.com/emacs-mirror/emacs.git
fi

cd $HOME/Development/emacs

# Generate config
./autogen.sh

./configure --without-compress-install  --with-native-compilation=aot --with-mailutils \
	--with-tree-sitter --with-x-toolkit=gtk3 --with-imagemagick \
        --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2 --with-xpm 


# Compile
make -j10


# Install
sudo make install

echo "Emacs has been built and installed successfully"

# enable emacs daemon through systemd
#systemctl enable --user emacs


echo "Emacs daemon has been enabled."
echo "Open Emacs and generate the init file"
