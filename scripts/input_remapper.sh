#!/usr/bin/env bash

wget https://github.com/sezanzeb/input-remapper/releases/download/2.0.1/input-remapper-2.0.1.deb -P ~/Downloads/

sudo apt install -y -f ~/Downloads/input-remapper-2.0.1.deb

#sudo systemctl enable --now input-remapper

echo "Installed Input Remapper"
