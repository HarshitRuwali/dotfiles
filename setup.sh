#!/bin/bash

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;35m'

echo -e "${BLUE}[!]${NC} Detecting the system OS"

if [ -f "/etc/arch-release" ]; then
	echo -e "${GREEN}[+]${NC} You are on Arch or Arch based system"
	echo -e "${GREEN}[+]${NC} Installing only core and mandetory packages"
	echo -e "${GREEN}[+]${NC} You will be prompted for the password for the installation"
	sudo pacman -S i3-wm i3lock i3status dmenu alacritty picom ttf-font-awesome feh arandr pasystray optimus-manager lxappearance imagemagick xfce4-power-manager xfce4-clipman-plugin light-locker caffeine-ng
	echo -e "${GREEN}[+]${NC} Copying the config files"
	mkdir -p "$HOME"/.config/{i3,picom,alacritty}
	cp -r conf/i3/* "$HOME"/.config/i3/
	cp -r conf/picom/* "$HOME"/.config/picom/
	cp -r conf/alacritty/* "$HOME"/.config/alacritty/
	echo -e "${RED}[?]${NC} Copy the zsh config file (.zshrc)?"
	echo -e "${BLUE}[!]${NC} You will need to manually install and configure Oh-My-Zsh, Powerlevel10k and zsh-autosuggestions. [Y/n] " 
	read response
	if [[ $response = Y ]] || [[ $response = y ]] ; then
		echo -e "${GREEN}[+]${NC} Copying the zshrc file"
		mv "$HOME"/.zshrc "$HOME"/.zshrc.bak
		cp  conf/.zshrc "$HOME"/.zshrc
	else
		echo -e "${BLUE}[!]${NC} Skipping"
		break
	fi
	
	echo -e "${RED}[?]${NC} Copy the tmux config file? For using tmux when not on i3"
	read response
	if [[ $response = Y ]] || [[ $response = y ]] ; then
    	echo -e "${GREEN}[+]${NC} Copying the tmux conf file"
    	mv "$HOME"/.tumx.conf "$HOME"/.tumx.conf.bak
		cp  conf/.tumx.conf "$HOME"/.tumx.conf
    else
		echo -e "${BLUE}[!]${NC} Skipping"
    	break
	fi

	echo -e "${GREEN}[+]${NC} Re-Boot"
	echo -e "${GREEN}[+]${NC} After reboot: : Select i3 on login, run lxappearance and select the theme to match the your system and xfce4-power-manger-settings to set the screen timeout and sleep settings. Use caffeine to disable screen-timout for certain apps."
else
	echo -e "${BLUE}[!]${NC} You are not on Arch or Arch based system"
	echo -e "${BLUE}[!]${NC} You have install packages manually"
	echo -e "${GREEN}[+]${NC} You might want to install the following packages: i3-wm, i3lock, i3status, dmenu, alacritty, picom, ttf-font-awesome, feh, arandr, pasystray, optimus-manager, lxappearance, imagemagick, xfce4-power-manager, xfce4-clipman-plugin, light-locker, caffeine-ng."
	read -p "${RED}[?]${NC} Still copy the config files? [Y/n]" response
	if [[ $response = Y ]] || [[ $response = y ]]; then
		echo -e "${GREEN}[+]${NC} Copying the config files"
		mkdir "$HOME"/.config/${i3,compton,alacritty}
		cp -r conf/i3/* "$HOME"/.config/i3/
		cp -r conf/picom/* "$HOME"/.config/compton/
		cp -r conf/alacritty/* "$HOME"/.config/alacritty/
		echo -e "${RED}[?]${NC} Copy the zsh config file (.zshrc)?"
		echo -e "${BLUE}[!]${NC} You will need to manually install and configure Oh-My-Zsh, Powerlevel10k and zsh-autosuggestions. [Y/n]" 
		read response
		if [[ $response = Y ]] || [[$response = y ]]; then
			echo -e "${GREEN}[+] Copying the zshrc file"
			mv "$HOME"/.zshrc "$HOME"/.zshrc.bak
			cp  conf/.zshrc "$HOME"/.zshrc
		else
			echo -e "${BLUE}[!]${NC} Skipping"
			break
		fi
		echo -e "Install the above packages and reboot."
		echo -e "After reboot: Select i3 on login, run lxappearance and select the theme to match the your system and xfce4-power-manger-settings to set the screen timeout and sleep settings. Also xfce4-screensaver-preferences to set the lock screen."
	else
		echo -e "${BLUE}[!]${NC} Exiting"
		exit 0;
	fi
fi
