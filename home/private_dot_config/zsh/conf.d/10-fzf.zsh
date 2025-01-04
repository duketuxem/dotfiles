# =============================================================================
#  Fuzzy File Finding
# =============================================================================

# this is a nice function
autoload -Uz is-at-least

fdbin='fd'
[[ "$DISTRO" = 'debian' ]] && fdbin='fdfind'

fdversion="$($fdbin --version | cut -d ' ' -f 2)"

if ! is-at-least "$fdversion" 0.48.0
then
	source /usr/share/doc/fzf/examples/completion.zsh
	source /usr/share/doc/fzf/examples/key-bindings.zsh
else
	source <(fzf --zsh)
	# source /usr/share/fzf/completion.zsh
	# source /usr/share/fzf/key-bindings.zsh
fi

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
