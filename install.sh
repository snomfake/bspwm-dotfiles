#!/bin/sh

function install_bspwm() {
	# installing dependencies
	sudo pacman -S alacritty bspwm dunst eza feh firefox fuse2 git htop \
                 libnotify neovim openssh pipewire pipewire-pulse playerctl \
                 polkit polybar python-pip ranger rofi scrot spotify-launcher \
                 sxhkd ueberzug unzip wireplumber xclip xf86-video-ati \
                 xorg-server xorg-xinit xorg-xrandr xorg-xset xorg-xsetroot
	
	# copy config files
  cp .bashrc $HOME/
	mkdir $HOME/.config
	cp -r ./config/* $HOME/.config/
  cp -r ./wallpapers $HOME/.config/bspwm/
	
	# copy themes/icons/fonts
	mkdir $HOME/.icons
	cp -r ./themes/icons/* $HOME/.icons
	mkdir $HOME/.fonts
	cp -r ./themes/fonts/* $HOME/.fonts
	
	# autostart xorg on login
	echo -e "if [ -z '\$DISPLAY' ] && [ '\$XDG_VTNR' = 1 ]; then\n \texec startx\ndone" >> $HOME/.bash_profile
	echo -e "#!/bin/sh\n\nexec sxhkd &\nexec bspwm" > $HOME/.xinitrc
	chmod u+x $HOME/.xinitrc
}

function reboot_sys() {
	echo "The PC will reboot through:"
	for i in 3 2 1; do
		echo $i
		sleep 1
	done
	reboot
}

clear
cat <<EOF

				██████╗  █████╗ ██████╗ ███████╗██╗███╗   ██╗
				██╔══██╗██╔══██╗██╔══██╗██╔════╝██║████╗  ██║
				██║  ██║███████║██████╔╝█████╗  ██║██╔██╗ ██║
				██║  ██║██╔══██║██╔══██╗██╔══╝  ██║██║╚██╗██║
				██████╔╝██║  ██║██║  ██║███████╗██║██║ ╚████║
				╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝
                                             	
				██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗
				██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║
				██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║
				██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║
				██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║
				╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝

EOF

# install configuration bspwm
echo -e "\nSet the bspwm configuration? (y[yes], n[no]): "
read resp_1
if [[ $resp_1 == "y" || $resp_1 == "yes" ]]; then
	install_bspwm
elif [[ $resp_1 == "n" || $resp_1 == "no" ]]; then 
	echo "Done!"
	exit
fi

# reboot pc
echo -e "\nYou want reboot system now? (y[yes], n[no]): "
read resp_3
if [[ $resp_3 == "y" || $resp_3 == "yes" ]]; then
	reboot_sys
elif [[ $resp_3 == "n" || $resp_3 == "no" ]]; then 
	echo "Done!"
	exit
fi
