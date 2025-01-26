### Shortcuts
## Based on commands
alias \
	agi='ag -i'				\
	cm='chezmoi'				\
	gad='git add'				\
	gbr='git branch -a'			\
	gch='git checkout'			\
	gco='git commit'			\
	gdi='git diff'				\
	gdis='git diff --staged'		\
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
	vi="vim" 				\
	vw='vim -c VimwikiIndex'		\
	xinst='sudo xbps-install'		\
	xquery='xbps-query'			\
	xremove='sudo xbps-remove'

## Based on configuration
alias \
	cmcd="cd $(chezmoi source-path)/.."			\
	reload="source $ZDOTDIR/zshrc"				\
	tconf="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"		\
	vconf="$EDITOR $XDG_CONFIG_HOME/vim/vimrc"			\
	xinitrc="$EDITOR $XDG_CONFIG_HOME/x11/xinitrc"		\
	zconf="$EDITOR $ZDOTDIR/zshrc"

## TODO: dirty admin to fix
alias \
	rack='sudo sshfs -oIdentityFile="$HOME"/.ssh/id_ed25519,allow_other root@192.168.50.179:/mnt /mnt/rack' \
	unrack='sudo umount -l /mnt/rack' \
	lsblk="lsblk; echo; ps aux | awk 'NR==1 || /sftp/ && !/awk/'"

# if X11 vs wayland...
alias clip='xclip -selection clipboard'

# nvm (or how soydevs are going to slow down my perfect config...)
# todo: lazy load
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
