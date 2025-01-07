# =============================================================================
#  Fuzzy File Finding
# =============================================================================

# From fzf changelog v0.48.0:
# Shell integration scripts are now embedded in the fzf binary
autoload -Uz is-at-least
if is-at-least 0.48.0 "$(fzf --version | cut -d ' ' -f 1)"
then
	source <(fzf --zsh)
	# source /usr/share/fzf/completion.zsh
	# source /usr/share/fzf/key-bindings.zsh
else
	if [ "$DISTRO" = 'debian' ]; then
		source /usr/share/doc/fzf/examples/completion.zsh \
			/usr/share/doc/fzf/examples/key-bindings.zsh
	fi
fi

# underlying binary used by fzf
fdbin='fd'
[[ "$DISTRO" = 'debian' ]] && fdbin='fdfind'

# FuzZy Finder - So awesome...
# - $FZF_TMUX_OPTS
# - $FZF_CTRL_T_COMMAND
# - $FZF_CTRL_T_OPTS
# - $FZF_CTRL_R_OPTS
# - $FZF_ALT_C_COMMAND
# - $FZF_ALT_C_OPTS
export FZF_DEFAULT_COMMAND="$fdbin -H --exclude 'node_modules' --exclude 'mozilla' --exclude '.git'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

#"^I" fzf-completion
#"^R" fzf-history-widget
#"^T" fzf-file-widget
#"^[c" fzf-cd-widget
