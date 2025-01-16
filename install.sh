#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Attempting to install Git..."
    
    # Use apt to install git
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install git -y
    else
        echo "Cannot install Git automatically using apt. Please install Git manually and run this script again."
        exit 1
    fi
    
    # Check again if git is installed after attempting to install
    if ! command -v git &> /dev/null; then
        echo "Git installation failed. Please install Git manually and run this script again."
        exit 1
    fi
fi


echo "Git is installed. Continuing with the setup..."

# TODO: Find a way to encrypt/decrypt a vault (ala Ansible Vault)



git clone https://github.com/juankprada/awesome-debian ~/aweseome-debian
git clone https://github.com/juankprada/dotfiles ~/dotfiles

clear

# Make the setup.sh executable
chmod +x ~/awesome-debian/scriptssetup.sh

# Run Setup script first

bash ~/awesome-debian/scripts/setup.sh

clear

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
