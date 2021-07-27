#!/bin/bash

echo "[!] Detecting the system OS"

if [ -f "/etc/arch-release" ]; then
	echo "[+] You are on Arch or Arch based system"
	echo "[+] Installing only core and mandetory packages"
	echo "[+] You will be prompted for the password for the installation"
	sudo pacaman -S i3-wm i3lock i3status alacritty picom ttf-font-awesome feh arandr optimus-manager lxappearance imagemagick
else
	echo "[!] You are not on Arch or Arch based system"
	echo "[!] You have install packages manually"
	echo "[+] You might want to install the following packages: i3-wm, i3lock, i3status, alacritty, picom, ttf-font-awesome, feh, arandr, optimus-manager, lxappearance, imagemagick"		
fi

echo "[+] Copying the config files"

mkdir "$HOME"/.config/{i3,picom,alacritty}

cp -r conf/i3/* "$HOME"/.config/i3/
cp -r conf/picom/* "$HOME"/.config/picom/
cp -r conf/alacritty/* "$HOME"/.config/alacritty/


# Optional if you want to use oh-my-zsh  

# mv "$HOME"/.zshrc "$HOME"/.zshrc.bak
# cp  conf/.zshrc "$HOME"/.zshrc

echo "[+] Done!"
echo "[+] After reboot: Select i3 on login, run lxappearance and select the theme to match the your system"