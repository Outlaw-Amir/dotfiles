#!/bin/env bash
echo "Installing..."
mkdir ~/.themes 2> /dev/null
tar -xf Gruvbox-Material-Green.tar.xz
cp -rf Gruvbox-Material-Green ~/.themes
cp -R .config/* ~/.config/
cp .alacritty.yml ~/.alacritty.yml
chmod -R +x ~/.config/sway/scripts
chmod -R +x ~/.config/waybar/scripts
chmod +x ~/.config/wofi/windows.py
echo "Please enter your password:"
sudo dnf install $(cat "packages-fedora.txt") -y

# Compiling and installing pamixer for audio volume control
git clone https://github.com/cdemoulins/pamixer.git
cd pamixer
meson setup build
meson compile -C build
meson install -C build
echo "         "
echo "Finished!"
