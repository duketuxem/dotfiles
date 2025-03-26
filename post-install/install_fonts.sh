#!/usr/bin/env sh

fonts_installed=0
target_font_dir="$HOME/.local/share/fonts"

if [ -f "$target_font_dir/CodeNewRomanNerdFont-Regular.otf" ]
then
	printf "CodeNewRoman is already installed.\n"
else
	curl -fLo "$target_font_dir/CodeNewRomanNerdFont-Regular.otf" \
		https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/CodeNewRoman/Regular/CodeNewRomanNerdFont-Regular.otf
	fonts_installed=1
fi

[ $fonts_installed -eq 1 ] && fc-cache -fv && \
	echo "Font installed! You should re-open your terminal emulator."
