# =============================================================================
# History
# =============================================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY		# (On by default)
setopt INC_APPEND_HISTORY	# Immediate recording
setopt HIST_IGNORE_DUPS		# Avoid ls ls ls ls
setopt HIST_IGNORE_SPACE	# Do not record ' cmd'
