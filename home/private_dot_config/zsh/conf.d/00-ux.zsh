# =============================================================================
# User eXperience
# =============================================================================

### Anything that can be so itchy if not set, colors, expected defaults...
### Since this file is loaded early, it is not meant to implement plugins, or
### add complex logic. This is just adapting the defaults in the idea.

### XDG Base Directory fixes:
alias wget='wget --no-hsts'

### Tweaks
alias \
	diff='diff --color=auto'					\
	dmesg='dmesg -L=auto'						\
	du='du -h'							\
	feh='feh --scale-down --full-screen'				\
	grep='grep --color=auto'					\
	ls='ls -h --color=auto --group-directories-first'		\
	mkdir='mkdir -p'						\
	mpv='mpv --fullscreen'						\
	nnn='nnn -e'							\
	patch='patch --reject-file=/dev/null --no-backup-if-mismatch --merge' \
	tree='tree --dirsfirst'						\
	watch='watch --color'						\
	xterm='xterm -bg black -fg white'

# Oh...
man() {
	# Enable color and use as much width as possible
	# md = Start bold effect (double-bright).
	# me = Stop bold effect.
	# us = Start underline effect.
	# ue = Stop underline effect.
	# so = Start stand-out effect (similar to reverse text).
	# se = Stop stand-out effect (similar to reverse text).
	# note: had to export so it would work on other platforms.
	export LESS="$LESS -j.5"		\
		LESS_TERMCAP_md=$'\e[01;34m'	\
		LESS_TERMCAP_me=$'\e[0m'	\
		LESS_TERMCAP_us=$'\e[01;32m'	\
		LESS_TERMCAP_ue=$'\e[0m'	\
		LESS_TERMCAP_so=$'\e[45;43m'	\
		LESS_TERMCAP_se=$'\e[0m'

	if [ "$DISTRO" = 'void' ]; then
		# man pages are not taking the maximum space...
		command man -O width=$(($(tput cols)-1)) "$@"
	else
		command man "$@"
	fi
}

### Shortcuts
## Based on commands
alias \
	gad='git add'				\
	gbr='git branch -a'			\
	gch='git checkout'			\
	gco='git commit'			\
	gdi='git diff'				\
	glo='git log --graph --decorate --all'	\
	gpu='git push'				\
	gst='git status'			\
	j='jobs'				\
	la='ls -a'				\
	ll='ls -l'				\
	lla='ls -al'				\
	ons='alsamixer'				\
	se='sudoedit'				\
	smci='sudo make clean install'		\
	v='vim' 				\
	vw='vim -c VimwikiIndex'		\
	xinst='sudo xbps-install'		\
	xquery='xbps-query'			\
	xremove='sudo xbps-remove'		\

## Based on configuration
alias \
	cmcd="cd $(chezmoi source-path)/.."
	reload="source $XDG_CONFIG_HOME/zsh/zshrc" \
	tconf="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf" \
	vconf="$EDITOR $XDG_CONFIG_HOME/vim/vimrc" \
	xinitrc="$EDITOR $XDG_CONFIG_HOME/x11/xinitrc" \
	zconf="$EDITOR $XDG_CONFIG_HOME/zsh/conf.d" \
	zshrc="$EDITOR $XDG_CONFIG_HOME/zsh/zshrc" \

## TODO: dirty admin to fix
alias \
	rack='sudo sshfs -oIdentityFile="$HOME"/.ssh/id_ed25519,allow_other root@192.168.50.179:/mnt /mnt/rack' \
	unrack='sudo umount -l /mnt/rack' \
	lsblk="lsblk; echo; ps aux | awk 'NR==1 || /sftp/ && !/awk/'"

# nvm (or how soydevs are going to slow down my perfect config...)
# todo: lazy load
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
