#!/usr/bin/env bash

sudo touch /etc/modprobe.d/hid_apple.conf

echo "options hid_apple fnmode=0" | sudo tee /etc/modprobe.d/hid_apple.conf

sudo update-initramfs -u
