#!/bin/bash

source gretting.sh

#if [ $UID -ne 0 ]; then
	#echo "This script must be run as root"
	#exit 1
#fi

if [ ! -f /usr/bin/curl ]; then
	echo "Can't find curl... \n"
	echo "Installing curl... "
	#yes | apt install curl
	sudo apt install curl
	echo "done"
fi

if [ ! -f /usr/bin/git ]; then
	echo "Can't find git...\n"
	echo "Installing git..."
	#yes | apt install git
	sudo apt install git
	echo "git installed\n"
fi

if [ ! -f /usr/bin/vim ]; then
	echo "Can't find vim...\n"
	echo "Installing vim..."
	sudo apt install vim
	#yes | apt install vim
	echo "vim installed\n"
fi

IDEA_ICON="Ultra-Flat"
ICON=$(gsettings get org.gnome.desktop.interface icon-theme)
if [ $ICON != "'$IDEA_ICON'" ]; then
	echo "Setting the icon..."
	sudo add-apt-repository ppa:noobslab/icons
	sudo apt-get update
	sudo apt-get install ultra-flat-icons
	gsettings set org.gnome.desktop.interface icon-theme $IDEA_ICON
fi


IDEA_THEME="Materia-dark"
THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [ $THEME != "'$IDEA_THEME'" ]; then
	echo "Setting the theme...\n"
	cd /tmp && wget -qO - https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
	cd materia-theme-master
	sudo ./install.sh
	if [ -e /usr/share/themes/Materia-dark ]; then
		gsettings set org.gnome.desktop.interface gtk-theme $IDEA_THEME
	elif [ -e /usr/share/themes/Materia ]; then
		gsettings set org.gnome.desktop.interface gtk-theme Materia
	fi
	echo "done"
fi

IDEA_FONT="Monaco 13"
FONT=$(gsettings get org.gnome.desktop.interface monospace-font-name)
# https://askubuntu.com/questions/731774/how-to-change-gnome-terminal-profile-preferences-using-dconf-or-gsettings
# https://gitlab.gnome.org/GNOME/gnome-terminal/blob/master/src/org.gnome.Terminal.gschema.xml
if [ "$FONT" != "'$IDEA_FONT'" ]; then
	echo "Setting the font...\n"
	if [ ! -e /home/$USER/.fonts/ ]; then
		mkdir /home/$USER/.fonts
		cd /home/$USER/.fonts
	fi
	if [ ! -e /home/$USER/.fonts/Monaco_Linux.ttf ]; then
		# https://askubuntu.com/questions/333409/how-to-install-the-monaco-font
		wget https://github.com/hbin/top-programming-fonts/raw/master/Monaco-Linux.ttf
		fc-cache -fv
		cd /home/$USER
	fi
	gsettings set org.gnome.desktop.interface monospace-font-name \'Monaco\ 13\'
	profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
	profile=${profile:1:-1} # remove leading and trailing single quotes
	gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" font "$IDEA_FONT"
	echo "done"
fi

DEST="/home/$USER/Pictures/Wallpapers/"
IDEA_BACKGROUND="Material_gray.jpg"
BACKGROUND=$(gsettings get org.gnome.desktop.background picture-uri)
if [ $BACKGROUND != '$DEST$IDEA_BACKGROUND' ]; then
	echo "Setting the background"
	if [ -e $DEST ]; then
		mkdir $DEST
	fi

	if [ ! -e $DESK$IDEA_BACKGROUND ]; then
		pic_url='https://wallpaperstudio10.com/static/wpdb/wallpapers/3840x2160/163704.jpg'
		wget -O $DEST$IDEA_BACKGROUND $pic_url
	fi

	#FILE=$(echo $pic_url | rev | cut -d '/' -f 1 | rev)
	#FILE=$(echo $pic_url | awk 'BEGIN {FS="/"} {print $NF}')
	chown $USER:$USER $DEST$IDEA_BACKGROUND
	URI="file://$DEST$IDEA_BACKGROUND"
	echo $URI
	gsettings set org.gnome.desktop.background picture-options 'centered'
	gsettings set org.gnome.desktop.background picture-uri ${URI}
fi

echo 'Everything is set'
exit 1
