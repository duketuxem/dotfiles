#!/bin/sh

# [package manager] update && upgrade
# [package manager] install git
# ~ $> mkdir -p workspace/ricing && cd workspace/ricing
# git clone monrepo/dotfiles && cd mon_repo
#
# ./deploy.sh

# Requirements for this script:
# 
# sudo
# a package manager

#install_freebsd_dependencies() {
#
#}


install_void_dependencies() {
        # [~/workspace/ricing/dotfiles] - Install dependencies

	printf "Installing all the dependencies for the Rice...\n"

	# compton
        sudo xbps-install curl base-devel xorg \
        libX11-devel libXft-devel libXinerama-devel \
        fonts-droid-ttf \
	&& printf "Dependencies successfully installed!\n\n"
}

install_suckless_suite() {
	# Leaving dotfiles repo...
        cd ..

	printf "Installing the suckless software suite...\n"
        git clone https://github.com/DukeTuxem/dwm.git \
        && cd dwm && git checkout my_fork \
        && sudo make install && cd .. && \

        git clone https://github.com/DukeTuxem/st.git \
        && cd st && git checkout my_fork \
        && sudo make install && cd .. && \
        
	#&& git checkout my_fork \
        git clone https://github.com/DukeTuxem/dmenu.git \
        && cd dmenu && sudo make install && cd .. \
	&& printf "Suckless suite successfully installed!\n\n" \
	|| printf "Some suckless program could not have been installed :(\n\n"
}

# For now just one
install_custom_fonts() {
	printf "Assert the custom font directory is existing..."
	cd && mkdir -p .local/share/fonts/ && cd .local/share/fonts
	
	printf "Downloading Hack Nerd Font..."
	curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" \
		https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

	fc-cache -fv ~/.local/share/fonts
	#if fc-match ... :
	printf "Hack installed!\n"
}

# Main

install_void_dependencies
install_suckless_suite 
install_custom_fonts

printf "Welcome home...\n"
