#!/bin/sh

function install_bspwm() {
	# installing dependencies
	sudo pacman -S alsa-utils base-devel bspwm dunst feh firefox flameshot \
				   fuse git htop kitty lsd mpv nemo os-prober pipewire \
				   pipewire-pulse polkit polybar rofi spotify-launcher sxhkd \
				   telegram-desktop unzip wireplumber xclip xf86-video-ati \
				   xorg-server xorg-xinit xorg-xrandr xorg-xsetroot
	
	# copy config files
	mkdir $HOME/.config
	cp -r ./config/* $HOME/.config/
  cp -r ./wallpapers $HOME/.config/bspwm/
	
	# copy themes/icons/fonts
	mkdir $HOME/.themes
	cp -r ./themes/themes/* $HOME/.themes
	mkdir $HOME/.icons
	cp -r ./themes/icons/* $HOME/.icons
	mkdir $HOME/.fonts
	cp -r ./themes/fonts/* $HOME/.fonts
	
	# aliasses
	echo -e "alias ll='lsd'\nalias tree='lsd --tree'\nalias vim='nvim'" >> $HOME/.bashrc
	
	# autostart xorg on login
	echo -e "if [ -z '\$DISPLAY' ] && [ '\$XDG_VTNR' = 1 ]; then\n \texec startx\ndone" >> $HOME/.bash_profile
	echo -e "exec sxhkd &\nexec bspwm" > $HOME/.xinitrc
	chmod u+x $HOME/.xinitrc
}

function install_spicefy() {
	# instal theme for spotify
	curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
	echo export PATH="$PATH:/home/$USER/.config/.spicetify" >> .bashrc
	echo spotify_path           = $HOME/.local/share/spotify-launcher/install/usr/share/spotify/ >> $HOME/.config/spicetify/config-xpui.ini
	spicetify update
	spicetify backup apply

	git clone --depth=1 https://github.com/spicetify/spicetify-themes.git 
	cd spicetify-themes
	cp -r * ~/.config/spicetify/Themes

	spicetify config current_theme text
	spicetify config color_scheme CatppuccinMocha
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

# install spicefy
clear
echo -e "\nInstall spicefy? (y[yes], n[no]): "
read resp_2
if [[ $resp_2 == "y" || $resp_2 == "yes" ]]; then
	install_spicefy
elif [[ $resp_2 == "n" || $resp_2 == "no" ]]; then 
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
