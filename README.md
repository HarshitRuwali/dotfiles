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

### Gnome-keyring & i3wm

Referrnig to the Arch Wiki about the Gnome-keyring here is the fix.

```
sudo cp /etc/pam.d/login /etc/pam.d.login.bak
sudo cp /etc/pam.d/passwd /etc/pam.d.passwd.bak
echo "auth     optional  pam_gnome_keyring.so"$'\n'"session  optional  pam_gnome_keyring.so auto_start" | sudo tee -a /etc/pam.d/login > /dev/null
echo "password  optional  pam_gnome_keyring.so" | sudo tee -a /etc/pam.d/passwd > /dev/null
echo "
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
  eval $(dbus-launch --sh-syntax --exit-with-session)
  export $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gnupg)
fi" >> .profile
```

This will unlock the gnome keyring. 

But browsers like chromium uses gnome-keyring to save the secret phrases which unclocks your saved cookies and passwords. 
For them doing this is not enough. There are two work arounds for this. 
  - Make the browers use gnome keyring. Done by using the flag `--password-store=gnome`. And making it persistant by placing the flag in the `~/.congfig/$brower-flags.conf` 
    - works for brave too
  This will make sure in the i3wm and DE to store the cookies in keyring.   

  - (NOT RECOMMENDED) Store the cookes in clear text using flag `--password-store=basic` in the primary DE by editing the launch prefernces. 
 

### power-manager/lock-screen

Initiall I was using 'xautolock' to auto-lock the screen and to put the system to sleep. But its was not good enough for me, as its locks the screen when I was using VLC and some other apps which prevents screen to lock. So I switched to the previous manger(xfce4-power-manger). 
I am using light-locker to lock the system with the default greeter and caffeine to disable screen-timout for certain apps(vlc & mpv..).

It just works so fine for me.
 
### Distro based package name

Picom/Compton:
 - I am on Arch Based system so for me its Picom. And for Debian based system is Compton.

### Alacritty config

For the Arch based system and Debian system the config differ and I have created the configs for the same. 
And the script will copy the correct config based on the OS.
  

## Ref's:
  - Shows current track playing on Spotify -> [https://github.com/rpieja/i3spotifystatus](https://github.com/rpieja/i3spotifystatus)

  - i3 lock for Dual-Display -> [https://github.com/ShikherVerma/i3lock-multimonitor](https://github.com/ShikherVerma/i3lock-multimonitor)

  - Gnome/Keyring Arch Wiki[https://wiki.archlinux.org/title/GNOME/Keyring#Using_the_keyring](https://wiki.archlinux.org/title/GNOME/Keyring#Using_the_keyring)
  
  - Chromium flag persistan [https://wiki.archlinux.org/title/Chromium#Making_flags_persistent](https://wiki.archlinux.org/title/Chromium#Making_flags_persistent)