#!/usr/bin/env bash

echo "Installing Nvidia GPU drivers"
sudo apt update
sudo apt install -y nvidia-kernel-dkms nvidia-driver firmware-misc-nonfree


# Check the output of the command
if [ "$(cat /sys/module/nvidia_drm/parameters/modeset)" = "N" ]; then
	echo "options nvidia-drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia-options.conf
fi
