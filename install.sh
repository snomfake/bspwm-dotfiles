#!/bin/sh

echo -e "darein bspwm builder\n"

for i in 3 2 1; do
	echo Start in $i
	sleep 1
done

# installing dependencies
echo Installing 

sudo pacman -S alsa-utils base-devel bspwm dunst eza feh firefox flameshot fuse git htop kitty \
	lxappearance mpv pipewire pipewire-pulse polkit polybar rofi sxhkd telegram-desktop thunar tumbler unzip \
	wireplumber xclip xf86-video-ati xorg-server xorg-xinit xorg-xrandr xorg-xsetroot

# move configs
mv ./config $HOME/.config/

# move icons/themes/fonts
sudo mv ./ui/.icons/* /usr/share/icons/
sudo mv ./ui/.themes/* /usr/share/themes/
sudo mv ./ui/.fonts/* /usr/share/fonts/

# aliases/autostart
echo -e "alias ll='eza -l -g --icons'\nalias tree='eza --tree --icons'\nalias vim='nvim'" >> $HOME/.bashrc
echo -e "if [ -z '\$DISPLAY' ] && [ '\$XDG_VTNR' = 1 ]; then\n \texec startx\ndone" >> $HOME/.bash_profile

# finish
echo -e "\nDone"
