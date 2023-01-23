########################################
# Reading from Terminfo
########################################

declare -A keys

# see `man terminfo`
keys[Enter]="${terminfo[cr]}"
keys[EnterNumpad]="${terminfo[kent]}"
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

for key val in "${(@kv)keys}"; do
	[[ -z "$val" ]] && printf "!! Missing terminfo entry for key: $key\n"
done


########################################
# Binding functions / plugins
########################################

# Adding '/' as a separator so backward-kill-custom will consider it
custom-backward-kill() {
	# A list of non-alphanumeric characters
	# considered part of a word by the line editor.
	local WORDCHARS='*?-[]~=&;!#$%^(){}<>|_.'
	zle backward-kill-word
}
zle -N custom-backward-kill    # Explicitely (-N) load a custom function

# Allow to execute vim with the current edited command in buffer
autoload edit-command-line; zle -N edit-command-line


########################################
# Bindings from scratch
########################################

bindkey -rp '' # (-r)emove binding from an empty (-p)refix, which matches all

# --: mark the end of options so only arguments are passed
bindkey -- "${keys[Enter]}"		accept-line
bindkey -- "${keys[EnterNumpad]}"	accept-line
bindkey -- "${keys[Backspace]}"		backward-delete-char
bindkey -- "${keys[Delete]}"		delete-char
bindkey -- "${keys[Up]}"		up-line-or-history
bindkey -- "${keys[Down]}"		down-line-or-history
bindkey -- "${keys[Left]}"		backward-char
bindkey -- "${keys[Right]}"		forward-char
bindkey -- "${keys[PageUp]}"		history-beginning-search-backward
bindkey -- "${keys[PageDown]}"		history-beginning-search-forward
bindkey -- "${keys[Home]}"		beginning-of-line
bindkey -- "${keys[End]}"		end-of-line

### "Insertable" chars (-R)anges
# "^\\\\" == ASCII[28] == File Separator == \034 == \x1C ==  Ctrl + \
bindkey -R -- " "-"~"			self-insert # Exclude control chars
# Free bindings left : ^^ | ^] | ^\, -- see caret notation
bindkey -- "\M-^@"-"\M-^?"		self-insert # Internationalization

# No mixing with Window Manager bindings!
bindkey -- '^[^?'			custom-backward-kill # Alt + Del
# Free: Alt + ~
# Free: F1..F12 (WM will be Alt+F1..F12)

###### Ctrl key
bindkey -- '^_'				undo
bindkey -- '^@'				redo
### Top row
bindkey -- '^Q'				beginning-of-line
bindkey -- '^W'				custom-backward-kill
bindkey -- '^E'				edit-command-line
bindkey -- '^R'				history-incremental-search-backward
#bindkey -- '^T'				FREE
bindkey -- '^I'				expand-or-complete # assigned later (fzf)
bindkey -- '^U'				backward-kill-line
#bindkey -- '^O'				FREE
bindkey -- '^P'				end-of-line
### Home row
#bindkey -- '^A'
#bindkey -- '^S'
#bindkey -- '^D'			# close term if no input but still...
#bindkey -- '^F'
#bindkey -- '^G'				list-expand
bindkey -- '^H'				custom-backward-kill # Also Ctrl + <BS>
#bindkey -- '^J'				#mandatory ?
bindkey -- '^K'				kill-line
bindkey -- '^L'				clear-screen # no terminfo entry (ff) ?
bindkey -- '^Y'				yank
### Bottom row
bindkey -- '^V'				quoted-insert
bindkey -- '^B'				execute-last-named-cmd
bindkey -- '^N'				execute-named-cmd
### Non alpha
bindkey -- '^[[1;5C'			forward-word
bindkey -- '^[[1;5D'			backward-word
bindkey -- '^[[3;5~'			kill-word	# Ctrl + Del

###### Misc.
bindkey -- "^[[200~"			bracketed-paste


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


### Resources
# `man zshzle`
# https://wiki.archlinux.org/title/zsh#Key_bindings
# https://unix.stackexchange.com/questions/253271	# Understanding CR/LF
