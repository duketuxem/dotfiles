# ============================================================================
# Bindings and mappings
# ============================================================================

### In this file:
### 1. Attempt to read the Terminfo database
### 2. Define custom functions/plugins ready to be bound
### 3. In the darkness, bind them all

### Terminfo
# Terminfo is an effort to establish a standard on top of historical different
# terminal emulator implementations.
# As such, the following makes use of the terminfo database to bind some common
# terminal escape sequences 'independantly' of the terminal emulator used.
# See `man terminfo`.

# Explicitely loading the zsh terminfo interface module
zmodload zsh/terminfo

# Custom associative array (-A) to be destroyed after bindings are done
# 'keys' is a custom implementation so it is not compatible with zkbd.
declare -A keys

## Read from the terminfo database for as many key to be mapped
# Commons
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
# Combinations
keys[CtrlRight]="^[[1;5C"
keys[CtrlLeft]="^[[1;5D"
keys[CtrlDel]="^[[3;5~"

case $TERM in
	# xterm or tty
        "xterm" | "xterm-256color")
		keys[Backspace]="${keys[Backspace]:-^H}"
		keys[Delete]="${keys[Delete]:-^[[3~}"
		keys[Up]="${keys[Up]:-^[[A}"
		keys[Left]="${keys[Left]:-^[[B}"
		keys[Right]="${keys[Right]:-^[[C}"
		keys[Down]="${keys[Down]:-^[[D}"
		keys[PageUp]="${keys[PageUp]:-^[[5~}"
		keys[PageDown]="${keys[PageDown]:-^[[6~}"
		keys[Home]="${keys[Home]:-^[[H}"
		keys[End]="${keys[End]:-^[[F}"
		keys[Tab]="${keys[Tab]:-	}"
		keys[ShiftTab]="${keys[ShiftTab]:-^[[Z}"
		;;
	# also tmux
	"screen" | "screen-256color")
		# fix backspace
			keys[Backspace]="${terminfo[kbs]:-^?}"
		keys[Delete]="${terminfo[kdch1]:-^[[3~}"
		keys[Up]="${terminfo[kcuu1]:-^[[A}"
		keys[Down]="${terminfo[kcud1]:-^[[B}"
		keys[Right]="${terminfo[kcuf1]:-^[[C}"
		keys[Left]="${terminfo[kcub1]:-^[[D}"
		keys[PageUp]="${terminfo[kpp]:-^[[5~}"
		keys[PageDown]="${terminfo[knp]:-^[[6~}"
			keys[Home]="${terminfo[khome]:-^[[1~}"
			keys[End]="${terminfo[kend]:-^[[4~}"
		keys[Tab]="${terminfo[ht]:-	}"
		keys[ShiftTab]="${terminfo[kcbt]:-^[[Z}"
		;;
	"linux")
		keys[CtrlLeft]="^[[D"
		keys[CtrlRight]="^[[C"
		;;

	*)
		echo >&2 "Unsupported terminal!"
		;;
esac


### Plugins

# backward-kill-word has to mind '/' and '$' as separators
custom-backward-kill() {
	# A list of non-alphanumeric characters
	# considered part of a word by the line editor.
	local WORDCHARS='*?-[]~=&;!#%^(){}<>|_.'
	zle backward-kill-word
}
# create a user-defined zle widget to be bound later
zle -N custom-backward-kill

# Allow to execute vim with the current edited command in buffer
autoload edit-command-line;
zle -N edit-command-line


### Bindings from scratch

### Overall:
### --------
### Exception for Alt+BS, otherwise no mixing with the Window Manager bindings!
### Alt + ~
### Alt + F1..F12
### ^ Those should be reserved for some Windows Manager functionnality
### --
### Zsh can use F1-F12 or even Ctrl+FX

### Reminder:
### --------
### ASCII[28] == File Separator == \034 == \x1c == Ctrl + \ == "^\\\\"
### -> 'showkey -a' is really helpful

## Erase everything then rebind
# Disable Ctrl + s / Ctrl + q (XON/XOFF) to free up two mappings
setopt NOFLOWCONTROL
# Remove (-r) all bindings from an empty prefix (-p), which matches all.
bindkey -rp ''

## Free: F1..F12

## Terminfo
# bindkey -- marks the end of options so only arguments are passed
bindkey -- "${keys[Enter]}" 		accept-line
bindkey -- "${keys[EnterNumpad]}"	accept-line
bindkey -- "${keys[Backspace]}"		backward-delete-char
bindkey -- "${keys[Delete]}"		delete-char
bindkey -- "${keys[Up]}"		up-line-or-history
bindkey -- "${keys[Down]}"		down-line-or-history
bindkey -- "${keys[Left]}" 		backward-char
bindkey -- "${keys[Right]}"		forward-char
bindkey -- "${keys[PageUp]}"		history-beginning-search-backward
bindkey -- "${keys[PageDown]}"		history-beginning-search-forward
bindkey -- "${keys[Home]}"		beginning-of-line
bindkey -- "${keys[End]}"		end-of-line
# fallback behavior for Tab & ShiftTab - since managed by fzf later
bindkey -- "${keys[Tab]}"		expand-or-complete
bindkey -- "${keys[ShiftTab]}"		expand-or-complete

## Letters
# ASCII characters from 32 to 126 as a (-R)ange
bindkey -R -- " "-"~"			self-insert # exclude control chars
bindkey -- "\M-^@"-"\M-^?"		self-insert # internationalization

## Control (^) sequences
# Free: ^[
bindkey -- '^_'				undo
bindkey -- '^@'				redo
# 		-- Top row --
bindkey -- '^Q'				beginning-of-line
bindkey -- '^W'				custom-backward-kill
bindkey -- '^E'				edit-command-line
# fallback, will become:		fzf-history-widget
bindkey -- '^R'				history-incremental-search-backward
#bindkey -- '^T'			fzf-file-widget
bindkey -- '^U'				backward-kill-line
#bindkey -- '^O'			FREE
bindkey -- '^P'				end-of-line
# 		-- Home row --
#bindkey -- '^A'			# tmux prefix
#bindkey -- '^S'			FREE
#bindkey -- '^F				# bookmarks with fzf
#bindkey -- '^G'			FREE
bindkey -- '^H'				backward-delete-char
#bindkey -- '^J'			FREE
bindkey -- '^K'				kill-line
bindkey -- '^L'				clear-screen	# no terminfo (ff) ?
bindkey -- '^Y'				yank
# 		-- Bottom row --
#bindkey -- '^X'			FREE
bindkey -- '^V'				quoted-insert
#bindkey -- '^B'			execute-last-named-cmd
#bindkey -- '^N'			execute-named-cmd

## Special
bindkey -- "^[[200~"			bracketed-paste

## Combinations
# 'Portable' Alt + Del
bindkey -- "^[${keys[Backspace]}"	custom-backward-kill
bindkey -- "${keys[CtrlRight]}"		forward-word
bindkey -- "${keys[CtrlLeft]}"		backward-word
bindkey -- "${keys[CtrlDel]}"		kill-word


### Make terminfo accessible:
### When running zsh, some terminals (like xterm) will not consider the
### terminfo array if the 'application mode' is not set during line edition.
### This mode is also known as the non-canonical, or raw mode for terminals.
### The terminfo database is only valid in that context, so the following
### enables/disables this mode everytime the zsh line editor is to be used.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

unset keys


### Resources
# `man zshzle`
# https://wiki.archlinux.org/title/zsh#Key_bindings
#
# Understanding CR/LF:
# https://unix.stackexchange.com/questions/253271
#
# How to get control characters for Ctrl+Left from terminfo in Zsh:
# https://stackoverflow.com/questions/31379824/
