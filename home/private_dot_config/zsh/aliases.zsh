## Wrappers
# XDG
alias wget='wget --no-hsts'

# Base tweaking
alias \
	diff='diff --color=auto'						\
	dmesg='dmesg -L=auto'							\
	df='df -h'								\
	du='du -h'								\
	feh='feh --scale-down --full-screen'					\
	grep='grep --color=auto'						\
	ls='ls -h --color=auto --group-directories-first'			\
	mkdir='mkdir -p'							\
	mpv='mpv --fullscreen'							\
	nnn='nnn -e'								\
	patch='patch --reject-file=/dev/null --no-backup-if-mismatch --merge'	\
	tree='tree -C --dirsfirst'						\
	watch='watch --color'							\
	xterm='xterm -bg black -fg white'

# Shortcuts that can use the above base
alias \
	agi='ag -i --hiden'							\
	cm='chezmoi'								\
	gad='git add'								\
	gbr='git branch -a'							\
	gch='git checkout'							\
	gco='git commit'							\
	gcom='git commit -m'							\
	gdi='git diff'								\
	gdis='git diff --staged'						\
	glo='git log --graph --decorate --all'					\
	glol='git log --graph --decorate --all --oneline'			\
	gpul='git pull'								\
	gpus='git push'								\
	gst='git status'							\
	j='jobs'								\
	la='ls -a'								\
	ll='ls -l'								\
	lla='ls -al'								\
	ons='alsamixer'								\
	se='sudoedit'								\
	smci='sudo make clean install'						\
	vi="vim" 								\
	vw='vim -c VimwikiIndex'						\
	xinst='sudo xbps-install'						\
	xquery='xbps-query'							\
	xremove='sudo xbps-remove'

## TODO: dirty admin to fix
alias \
	rack='sudo sshfs -oIdentityFile="$HOME"/.ssh/id_ed25519,allow_other root@192.168.50.179:/mnt /mnt/rack' \
	unrack='sudo umount -l /mnt/rack' \
	lsblk="lsblk; echo; ps aux | awk 'NR==1 || /sftp/ && !/awk/'"

# if X11 vs wayland...
alias clip='xclip -selection clipboard'

# Config-specific shortcuts
alias \
	cmcd="cd $(chezmoi source-path)/.."					\
	cmdi="chezmoi diff"							\
	cmradi="chezmoi re-add --interactive"					\
	reload="source $ZDOTDIR/zshrc"						\
	tconf="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"				\
	vconf="$EDITOR $XDG_CONFIG_HOME/vim/vimrc"				\
	xinitrc="$EDITOR $XDG_CONFIG_HOME/x11/xinitrc"				\
	aliases="$EDITOR $ZDOTDIR/aliases.zsh"					\
	zconf="$EDITOR $ZDOTDIR/.zshrc"

## Directory stack
# A quick cd "history":
# usage: `s` to show the dir stack, any number for quick cd previous/next
alias s='dirs -v | sed 11q'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

## favzf
alias cdf='eval cd $(fzf < $CDFAVS)'
alias efav="$EDITOR $CDFAVS"
alias favs="$PAGER $CDFAVS"
alias f="favs"
