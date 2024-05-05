# =============================================================================
# Notes
# =============================================================================
#
# This script is doing the following:
# 1. Attempt to read the Terminfo database
# 2. Define custom functions/plugins ready to be bound
# 3. In the darkness, bind them all
#
# Overall:
# --------
# Exception for Alt+BS, otherwise no mixing with the Window Manager bindings!
# Alt + ~
# Alt + F1..F12
# ^ Those should be reserved for some Windows Manager functionnality
#
# Technical:
# ----------
#
# 'keys' is a custom implementation so it is not compatible with zkbd.
#
# zle -N : explicitely load a function so it can be bound before calling it
#
# bindkey -- : mark the end of the options so only arguments are passed
#
# [Reminder about the syntax for non printable ASCII]
# ASCII[28] == File Separator == \034 == \x1c == Ctrl + \ == "^\\\\"
# -> 'showkey -a' is really helpful


# =============================================================================
# Reading from Terminfo and adapting
# =============================================================================

# Terminfo is an effort to establish a standard on top of historical different
# terminal emulator implementations.
# As such, the following makes use of the terminfo database to bind some common
# terminal escape sequences 'independantly' of the terminal emulator used.
# See `man terminfo`.

# Explicitely loading the zsh terminfo interface module
zmodload zsh/terminfo

# Custom associative array (-A) to be destroyed after bindings are done
declare -A keys

keys[Enter]="${terminfo[cr]:-^M}"
keys[EnterNumpad]="${terminfo[kent]:-^M}"
keys[Backspace]="${terminfo[kbs]}"
keys[Delete]="${terminfo[kdch1]}"
keys[Up]="${terminfo[kcuu1]}"
keys[Down]="${terminfo[kcud1]}"
keys[Left]="${terminfo[kcub1]}"
keys[Right]="${terminfo[kcuf1]}"
keys[PageUp]="${terminfo[kpp]}"
keys[PageDown]="${terminfo[knp]}"
keys[Home]="${terminfo[khome]}"
keys[End]="${terminfo[kend]}"
keys[Tab]="${terminfo[ht]}"
keys[ShiftTab]="${terminfo[kcbt]}"

# The state of the xterm 'compliance'...
# TODO (low): fix tmux/screen in xterm
# - maybe detect the terminal emulator
case $TERM in
        "xterm")
		# it seems xterm ignores this terminfo entry
		keys[Backspace]="^H"
		;;
	"screen" | "screen-256color")
		# and it seems it is wrong in that context
		# (tmux backspace fix)
		keys[Backspace]="^?"
		;;
esac

# Warning to show which keys will fail to be bound
for key val in "${(@kv)keys}"
do
	if [[ -z "$val" ]]
	then
		echo "(!) Missing terminfo entry for key : $key (!)" 2>&1
	fi
	# echo "$key -> $val" | cat -vt
done


# =============================================================================
# Custom functions / plugins
# =============================================================================

# backward-kill-word has to mind '/' and '$' as separators
custom-backward-kill() {
	# A list of non-alphanumeric characters
	# considered part of a word by the line editor.
	local WORDCHARS='*?-[]~=&;!#%^(){}<>|_.'
	zle backward-kill-word
}
zle -N custom-backward-kill

# Use of local ?
append-grep() {
	BUFFER+="| grep -i "
	zle end-of-line
}
zle -N append-grep

accept-line-with-pager() {
	BUFFER+=" | \"$PAGER\""
	zle accept-line
}
zle -N accept-line-with-pager

# Allow to execute vim with the current edited command in buffer
autoload edit-command-line;
zle -N edit-command-line


# ============================================================================
# Bindings from scratch
# ============================================================================

# Disable Ctrl + s / Ctrl + q (XON/XOFF) to free up two mappings
setopt NOFLOWCONTROL

# Remove (-r) all bindings from an empty prefix (-p), which matches all.
bindkey -rp ''

###### keys array binding

bindkey -- "${keys[Enter]}" 		accept-line
bindkey -- "${keys[EnterNumpad]}"	accept-line

[[ -n "${terminfo[kbs]}" ]] &&		\
	bindkey -- "${keys[Backspace]}"	backward-delete-char
[[ -n "${terminfo[kdch1]}" ]] &&	\
	bindkey -- "${keys[Delete]}"	delete-char
[[ -n "${terminfo[kcuu1]}" ]] &&	\
	bindkey -- "${keys[Up]}"	up-line-or-history
[[ -n "${terminfo[kcud1]}" ]] &&	\
	bindkey -- "${keys[Down]}"	down-line-or-history
[[ -n "${terminfo[kcub1]}" ]] &&	\
	bindkey -- "${keys[Left]}" 	backward-char
[[ -n "${terminfo[kcuf1]}" ]] &&	\
	bindkey -- "${keys[Right]}"	forward-char
[[ -n "${terminfo[kpp]}" ]] &&		\
	bindkey -- "${keys[PageUp]}"	history-beginning-search-backward
[[ -n "${terminfo[knp]}" ]] &&		\
	bindkey -- "${keys[PageDown]}"	history-beginning-search-forward
[[ -n "${terminfo[khome]}" ]] &&	\
	bindkey -- "${keys[Home]}"	beginning-of-line
[[ -n "${terminfo[kend]}" ]] &&		\
	bindkey -- "${keys[End]}"	end-of-line
# Fallback (since managed by fzf later) behavior for Tab & ShiftTab
[[ -n "${terminfo[ht]}"	]] &&		\
	bindkey -- "${keys[Tab]}"	expand-or-complete
# 'Portable' Alt + Del
bindkey -- "^[${keys[Backspace]}"	custom-backward-kill


### Map the ASCII chracters from 32 to 127 as a (-R)ange
bindkey -R -- " "-"~"		self-insert # Exclude control chars
bindkey -- "\M-^@"-"\M-^?"	self-insert # Internationalization

# Free bindings left : ^^
bindkey -- '^_'			undo
bindkey -- '^@'			redo
### Top row
bindkey -- '^Q'			beginning-of-line
bindkey -- '^W'			custom-backward-kill
bindkey -- '^E'			edit-command-line
bindkey -- '^R'			history-incremental-search-backward
# bindkey -- '^T'			FREE
bindkey -- '^U'			backward-kill-line
#bindkey -- '^O'			FREE
bindkey -- '^P'			end-of-line
### Home row
#bindkey -- '^A'
bindkey -- '^S'			accept-line-with-pager
#bindkey -- '^F
bindkey -- '^G'			append-grep
bindkey -- '^H'			backward-delete-char
#bindkey -- '^J'			#mandatory ?
bindkey -- '^K'			kill-line
bindkey -- '^L'			clear-screen	# no terminfo entry (ff) ?
bindkey -- '^Y'			yank
### Bottom row
#bindkey -- '^X'
bindkey -- '^V'			quoted-insert
bindkey -- '^B'			execute-last-named-cmd
bindkey -- '^N'			execute-named-cmd
# Free: F1..F12
### Non alpha
# info: broken on urxvt, and probably others
bindkey -- '^[[1;5C'		forward-word	# Ctrl + Right
bindkey -- '^[[1;5D'		backward-word	# Ctrl + Left
bindkey -- '^[[3;5~'		kill-word	# Ctrl + Del

###### Misc.
bindkey -- "^[[200~"		bracketed-paste

###### TERM=Linux
bindkey -- "^[[D"		backward-word
bindkey -- "^[[C"		forward-word

###### TERM=st
# if TERM = ST then...
#

# When running zsh, some terminals (like xterm) will not consider the
# terminfo array if the 'application mode' is not set during line edition.
# This mode is also known as the non-canonical, or raw mode for terminals.
# The terminfo database is only valid in that context, so the following
# enables/disables this mode everytime the zsh line editor is to be used.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Unset the previously declared array
unset keys


### Resources
# `man zshzle`
# https://wiki.archlinux.org/title/zsh#Key_bindings
#
# Understanding CR/LF:
# https://unix.stackexchange.com/questions/253271
#
# How to get How to get control characters for Ctrl+Left from terminfo in Zsh:
# https://stackoverflow.com/questions/31379824/
