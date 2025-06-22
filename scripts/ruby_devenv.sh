#!/usr/bin/env bash

# Function to check if font directory exists
check_rbenv_installed() {
    if [ -d $HOME/.rbenv/bin/rbenv ]; then
        echo "Rbenv is already installed Skipping."
        return 0  # already installed
    else
        return 1  # not installed
    fi
}

if check_rbenv_installed = 1; then
   
	echo "Cloning Rbenv repository..."
	git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv

	bash $HOME/.rbenv/bin/rbenv init > /dev/null

	mkdir -p $HOME/.rbenv/plugins/

	echo "Cloning Ruby Build..."
	git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build


	echo "installing Rbenv..."
	eval "$({{ ansible_env.HOME }}/.rbenv/bin/rbenv init - --no-rehash bash)" && rbenv install --skip-existing 3.3.4
else
	echo "Rbenv is already installed. Skipping"
fi
