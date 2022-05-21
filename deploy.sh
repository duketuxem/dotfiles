#!/bin/sh
# (Tested on dash from void linux)

# Requirements for this script:
# sudo (installed by default on void)
# xbps update/upgrade + Git


set -eu


TUNING_DIR="$HOME/workspace/ricing"

###
# Utils
###
error() {
    printf "\033[0;1;31m$*\033[0m\n"
    exit
}

success() {
    printf "\033[0;1;32m$*\033[0m\n"
}

warning() {
    printf "\033[0;1;33m$*\033[0m\n"
}

info() {
    printf "\033[0;1;34m$*\033[0m\n"
}

step() {
    printf "\033[0;1;35m$*\033[0m\n"
}

call() {
    info "$*"

    "$@"
    ret=$?
    if [ $ret -ne 0 ]
    then
        error "$*\nreturned: $ret"
        exit $ret
    fi
}

###
# Actual steps
###
install_void_dependencies() {
    step "Checking the package requirements for the Rice..."

    # picom will not be installed before the tests occur on a
    # physical machine since the graphic adapter in VirtualBox
    # does not like the --experimental-backends option from picom
    # picom
    call sudo xbps-install -y curl base-devel xorg \
    libX11-devel libXft-devel libXinerama-devel \
    noto-fonts-cjk \
    zsh zsh-syntax-highlighting fzf \
    tmux vim htop \
    && success "Package requirements satisfied!\n"
}

install_suckless_suite() {
    # TODO: intelligent git pull if already existing ?
    call cd
    call mkdir -p "$TUNING_DIR"
    call cd "$TUNING_DIR"

    step "Installing the suckless software suite...\n"
    git clone https://github.com/DukeTuxem/dwm.git -b my_fork \
    && cd dwm && sudo make install && cd .. && \

    call git clone https://github.com/DukeTuxem/st.git -b my_fork \
    && cd st && sudo make install && cd .. && \

    git clone https://github.com/DukeTuxem/dmenu.git -b my_fork \
    && cd dmenu && sudo make install && cd .. \
    && success "Suckless suite successfully installed!\n" \
    || error "Some suckless program could not have been installed :(\n\n"
}

install_custom_fonts() {
    step "Asserting that the custom font directory is existing..."
    call cd
    call mkdir -p .local/share/fonts/
    call cd .local/share/fonts

    INSTALL=0
    if [ ! -f "Hack Regular Nerd Font Complete Mono.ttf" ]; then
        step "Downloading Hack Nerd Font..."
        curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" \
            https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
	INSTALL=1
    fi

    if [ ! -f "Code New Roman Nerd Font Complete Mono.otf" ]; then
        step "Downloading Code New Roman Nerd Font..."
        curl -fLo "Code New Roman Nerd Font Complete Mono.otf" \
            https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CodeNewRoman/Regular/complete/Code%20New%20Roman%20Nerd%20Font%20Complete%20Mono.otf
        INSTALL=1
    fi

    if [ "$INSTALL" -eq 1 ]; then
	fc-cache -fv ~/.local/share/fonts
        success "Fonts successfully installed!"
    else
	success "Fonts already installed!"
    fi
}


import_config() {
    # Todo: same work on install_suckless_suite function that needs to be done.
    call cd
    call cp -r dotfiles/.config .
    call cp -r dotfiles/.local .
    call git clone --bare https://github.com/DukeTuxem/dotfiles .dotfiles

    # Redirect zsh dotfiles to ~/.config/zsh
    call sudo sh -c 'printf "export ZDOTDIR=\"\$HOME\"/.config/zsh\n" > /etc/zsh/zshenv'
    # Change shell
    call chsh -s /bin/zsh
}


###
# Main
###
call sudo xbps-install -Suy && success "System is up to date!"

install_void_dependencies
install_suckless_suite
install_custom_fonts
import_config

#printf "Logout and login again...\n"
