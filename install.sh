#!/usr/bin/env bash

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


mkdir -p $HOME/Development/

git clone https://github.com/juankprada/awesome-debian $HOME/Development/awesome-debian


clear

# Make the setup.sh executable
chmod +x $HOME/Development/awesome-debian/scripts/setup.sh

# Run Setup script first
echo "Running setup script..."
cd $HOME/Development/awesome-debian/
bash ./scripts/setup.sh



printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
