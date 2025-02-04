#!/usr/bin/env bash


# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Installing dependencies"
sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

if [ -d ~/Development/alacritty ]; then
    cd ~/Development/alacritty
    echo "Updating Alacritty sources..."
    git fetch origin
    git pull
else
    echo "Cloning Alacritty sources repo..."
    cd ~/Development
    git clone https://github.com/alacritty/alacritty.git 
    cd ~/Development/alacritty
fi

# Build
echo "Building alacritty"
cargo build --release


sudo tic -xe alacritty,alacritty-direct extra/alacritty.info


sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty

# make sure apt version of alacritty is removed
sudo apt remove alacritty

echo "Finished installing Alacritty from source."
