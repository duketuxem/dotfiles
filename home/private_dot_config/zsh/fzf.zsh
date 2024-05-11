
# FuzZy Finder - So awesome...
# - $FZF_TMUX_OPTS
# - $FZF_CTRL_T_COMMAND
# - $FZF_CTRL_T_OPTS
# - $FZF_CTRL_R_OPTS
# - $FZF_ALT_C_COMMAND
# - $FZF_ALT_C_OPTS
export FZF_DEFAULT_COMMAND="fd -H --exclude 'node_modules' --exclude 'mozilla' --exclude '.git'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
