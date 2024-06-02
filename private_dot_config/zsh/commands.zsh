# -----------------------------------------------------------------------------
# Tweaks
# -----------------------------------------------------------------------------
alias \
	feh='feh --scale-down --full-screen' 				\
	mpv='mpv --fullscreen'		 				\
        diff='diff --color=auto' 					\
        dmesg='dmesg -L=auto' 						\
        du='du -h' 							\
        grep='grep --color=auto'		 			\
        less='less -R' 							\
        ls='ls -h --color=auto --group-directories-first' 		      \
        mkdir='mkdir -p' 						      \
        patch='patch --reject-file=/dev/null --no-backup-if-mismatch --merge' \
        xterm='xterm -bg black -fg white'


# Oh...
man() {
	# Enable color and use as much width as possible
	#
	# md = Start bold effect (double-bright).
	# me = Stop bold effect.
	# us = Start underline effect.
	# ue = Stop underline effect.
	# so = Start stand-out effect (similar to reverse text).
	# se = Stop stand-out effect (similar to reverse text).
	LESS="-j.5"			\
	LESS_TERMCAP_md=$'\e[01;34m'    \
	LESS_TERMCAP_me=$'\e[0m'        \
	LESS_TERMCAP_us=$'\e[01;32m'    \
	LESS_TERMCAP_ue=$'\e[0m'        \
	LESS_TERMCAP_so=$'\e[45;43m'    \
	LESS_TERMCAP_se=$'\e[0m'        \
	command man -O width=$(($(tput cols)-10)) "$@"
	# -O indent=10 ?
}



#vi='GIT_DIR="$HOME"/.dotfiles GIT_WORK_TREE="$HOME" vim' \

### XDG Base Directory fixes:
alias wget='wget --no-hsts'


### Shortcuts
# conflicts with ghostscript
        # gs='git status' \
alias \
	la='ls -a'				\
	ll='ls -l'				\
	lla='ls -al'				\
        ga='git add'				\
        gc='git checkout'			\
        gd='git diff'				\
        gl='git log'				\
        j='jobs'				\
        ons='alsamixer'				\
        se='sudoedit'				\
        smci='sudo make clean install'		\
        vi='vim'				\
        xinst='sudo xbps-install'		\
        xquery='xbps-query'			\
        xremove='sudo xbps-remove'		\
	tree='tree --dirsfirst'			\
	vw='vim -c VimwikiIndex'		\
	nnn='nnn -e'				\
	watch='watch --color'

### Config
alias \
        dot='/usr/bin/git --git-dir="$HOME"/.dotfiles --work-tree="$HOME"' \
        da='dot add' \
        ds='dot status' \
        dl='dot log' \
        ddif='dot diff' \
        reload="source $XDG_CONFIG_HOME/zsh/zshrc" \
        tconf="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf" \
        vconf="$EDITOR $XDG_CONFIG_HOME/vim/vimrc" \
        xinitrc="$EDITOR $XDG_CONFIG_HOME/x11/xinitrc" \
        zprofile="$EDITOR $XDG_CONFIG_HOME/zsh/zprofile" \
        zconf="$EDITOR $XDG_CONFIG_HOME/zsh/zshrc"

### Admin
alias \
	rack='sudo sshfs -oIdentityFile=/home/remi/.ssh/id_ed25519,allow_other root@192.168.50.179:/mnt /mnt/rack' \
	unrack='sudo umount -l /mnt/rack' \
	lsblk="lsblk; echo; ps aux | awk 'NR==1 || /sftp/ && !/awk/'"


# vim: ft=zsh
