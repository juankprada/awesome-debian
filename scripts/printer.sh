#!/usr/bin/env bash


wget --show-progress "https://download.brother.com/welcome/dlf100889/linux-brjprinter-installer-2.2.4-1.gz" -P ~/Downloads/

cd ~/Downloads/

gunzip linux-brjprinter-installer-2.2.4-1.gz

sudo bash linux-brjprinter-installer-2.2.4-1 MFC-J7100CDW
