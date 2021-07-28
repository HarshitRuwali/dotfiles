#!/bin/bash

echo "[!] Detecting the system OS"

if [ -f "/etc/arch-release" ]; then
	echo "[+] You are on Arch or Arch based system"
	echo "[+] Installing only core and mandetory packages"
	echo "[+] You will be prompted for the password for the installation"
	sudo pacaman -S i3-wm i3lock i3status alacritty picom ttf-font-awesome feh arandr optimus-manager lxappearance imagemagick xfce4-power-manger
	echo "[+] Copying the config files"
	mkdir "$HOME"/.config/{i3,picom,alacritty}
	cp -r conf/i3/* "$HOME"/.config/i3/
	cp -r conf/picom/* "$HOME"/.config/picom/
	cp -r conf/alacritty/* "$HOME"/.config/alacritty/
	echo "[?] Copy the zsh config file (.zshrc)?"
	read -p "[!] You will need to manually install and configure Oh-My-Zsh, Powerlevel10k and zsh-autosuggestions. [Y/n]" response
	if [[ $response = Y ]]; then
		echo "[+] Copying the zshrc file"
		mv "$HOME"/.zshrc "$HOME"/.zshrc.bak
		cp  conf/.zshrc "$HOME"/.zshrc
	else
		echo "[!] Skipping"
		break
	fi
	echo "[+] Done!"
	echo "[+] Re-Boot"
	echo "[+] After reboot: : Select i3 on login, run lxappearance and select the theme to match the your system and xfce4-power-manger-settings to set the screen timeout and sleep settings."
else
	echo "[!] You are not on Arch or Arch based system"
	echo "[!] You have install packages manually"
	echo "[+] You might want to install the following packages: i3-wm, i3lock, i3status, alacritty, picom, ttf-font-awesome, feh, arandr, optimus-manager, lxappearance, imagemagick, xfce4-power-manger."
	read -p "[?] Still copy the config files? [Y/n]" response
	if [[ $response = Y ]]; then
		echo "[+] Copying the config files"
		mkdir "$HOME"/.config/{i3,compton,alacritty}
		cp -r conf/i3/* "$HOME"/.config/i3/
		cp -r conf/picom/* "$HOME"/.config/compton/
		cp -r conf/alacritty/* "$HOME"/.config/alacritty/
		echo "[?] Copy the zsh config file (.zshrc)?"
		read -p "[!] You will need to manually install and configure Oh-My-Zsh, Powerlevel10k and zsh-autosuggestions. [Y/n]" response
		if [[ $response = Y ]]; then
			echo "[+] Copying the zshrc file"
			mv "$HOME"/.zshrc "$HOME"/.zshrc.bak
			cp  conf/.zshrc "$HOME"/.zshrc
		else
			echo "[!] Skipping"
			break
		fi
		echo "Install the above packages and reboot."
		echo "After reboot: Select i3 on login, run lxappearance and select the theme to match the your system and xfce4-power-manger-settings to set the screen timeout and sleep settings"
	else
		echo "[!] Exiting"
		exit 0;
	fi
fi
