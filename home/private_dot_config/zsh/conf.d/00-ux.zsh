# =============================================================================
# User eXperience
# =============================================================================

### Anything that can be so itchy if not set, colors, expected defaults...
### Since this file is loaded early, it is not meant to implement plugins, or
### add complex logic. This is just _overriding_ the defaults in the idea.

### Miscellaneous
setopt NOTIFY	# Report background job status immediately vs next prompt
unsetopt BEEP	# That lovely bell sound, is it off by default?

### Fixes
## GUI:
# Java apps now work with Tiling Window Managers
export _JAVA_AWT_WM_NONREPARENTING=1
# Fix awfully looking fonts in java apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

## CLI:

## XDG:
# this is 'because' I use wget that I need the fix to be here.
alias wget='wget --no-hsts'

### Tweaks
alias \
	diff='diff --color=auto'					\
	dmesg='dmesg -L=auto'						\
	df='df -h'							\
	du='du -h'							\
	feh='feh --scale-down --full-screen'				\
	grep='grep --color=auto'					\
	ls='ls -h --color=auto --group-directories-first'		\
	mkdir='mkdir -p'						\
	mpv='mpv --fullscreen'						\
	nnn='nnn -e'							\
	patch='patch --reject-file=/dev/null --no-backup-if-mismatch --merge' \
	tree='tree -C --dirsfirst'					\
	watch='watch --color'						\
	xterm='xterm -bg black -fg white'

# Enable color in less and use as much width as possible
# md = Start bold effect (double-bright).
# me = Stop bold effect.
# us = Start underline effect.
# ue = Stop underline effect.
# so = Start stand-out effect (similar to reverse text).
# se = Stop stand-out effect (similar to reverse text).
# note: had to export so it would work on other platforms.
export LESS_TERMCAP_md=$'\e[01;34m'	\
	LESS_TERMCAP_me=$'\e[0m'	\
	LESS_TERMCAP_us=$'\e[01;32m'	\
	LESS_TERMCAP_ue=$'\e[0m'	\
	LESS_TERMCAP_so=$'\e[45;43m'	\
	LESS_TERMCAP_se=$'\e[0m'

# Oh...
man() {
	if [ "$DISTRO" = 'void' ]; then
		# man pages are not taking the maximum space...
		command man -O width=$(($(tput cols)-1)) "$@"
	else
		command man "$@"
	fi
}
