#!/bin/bash


## Installing packeges is for Arch Based systems Only.

if [ -f "/etc/arch-release" ]; then
	echo "You are on Arch based system"
	echo "Installing only core and mandetory packages"
	echo "You will be prompted for the password for the installation"
	sudo pacaman -S i3-wm i3lock i3status alacritty picom ttf-font-awesome feh arandr optimus-manager
else
	echo "You are not on Arch based system"
	echo "You have install dependencies manually"
fi


mkdir "$HOME"/.config/{i3,picom,alacritty}

cp -r conf/i3/* "$HOME"/.config/i3/
cp -r conf/picom/* "$HOME"/.config/picom/
cp -r conf/alacritty/* "$HOME"/.config/alacritty/


# Optional if you want to use oh-my-zsh  

# mv "$HOME"/.zshrc "$HOME"/.zshrc.bak
# cp  conf/.zshrc "$HOME"/.zshrc

