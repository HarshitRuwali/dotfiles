# dotfiles

My dotfiles mainly for i3 setup, with Picom and Alacritty. 


![desktop-env-i3](./images/display.png)


## Setting up a fresh environment 

Run the setup.sh file.  

And if you are on [Arch](https://archlinux.org/) or Arch Based Distro like [Garuda Linux](https://garudalinux.org/), [Manjaro](https://manjaro.org/), [ArcoLinux](https://arcolinux.com/)....then you will be prompted for the password to install the necessary packages. And will copy the config files. 

And if you are not on Arch Based Distro, then it will prompt you the necessary packages which needs to be installed and will ask to copy the config files or not.

And dont run the script as `root` otherwise the config files will be placed on the root's home directory.

And for wallpaper you have to manually pass the file location in the config file.

### Mod Key

Mod($mod) Key is Windows/Super.
Mod1($mod1) Key is Alt.

### power-manager/lock-screen

Initiall I was using 'xautolock' to auto-lock the screen and to put the system to sleep. But its was not good enough for me, as its locks the screen when I was using VLC and some other apps which prevents screen to lock. So I switched to the previous manger(xfce4-power-manger). 
I am using light-locker to lock the system with the default greeter and caffeine to disable screen-timout for certain apps(vlc & mpv..).

It just works so fine for me.
 
### Distro based package name

Picom/Compton:
 - I am on Arch Based system so for me its Picom. And for Debian based system is Compton.
 

## Ref's:
  - Shows current track playing on Spotify -> [https://github.com/rpieja/i3spotifystatus](https://github.com/rpieja/i3spotifystatus)

  - i3 lock for Dual-Display -> [https://github.com/ShikherVerma/i3lock-multimonitor](https://github.com/ShikherVerma/i3lock-multimonitor)

