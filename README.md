# dotfiles

My dotfiles mainly for i3 setup. 


![desktop-env-i3](./images/display.png)


## Setting up a fresh environment 

If you are on a [Arch](https://archlinux.org/) or Arch Based system like [Garuda Linux](https://garudalinux.org/), [Manjaro](https://manjaro.org/), [ArcoLinux](https://arcolinux.com/)... then just run the setup.sh script. 

You will be prompted for the passwod to install the necessary packages. And dont run the script as `root` otherwise the config files will be placed on the root's home directory.


Mod Key is Windows/Super.

### power-manager/lock-screen

Initiall I was using 'xautolock' to auto-lock the screen and to put the system to sleep. But its was not good enough for me, as its locks the screen when I was using VLC and some other apps which prevents screen to lock. So I switched to the previous manger(xfce4-power-manger). 
 


Picom/Compton:
 - I am on Arch Based system so for me its Picom. And for Debian based system is Compton.
 

## Ref's:
  - Shows current track playing on Spotify -> [https://github.com/rpieja/i3spotifystatus](https://github.com/rpieja/i3spotifystatus)

  - i3 lock for Dual-Display -> [https://github.com/ShikherVerma/i3lock-multimonitor](https://github.com/ShikherVerma/i3lock-multimonitor)

