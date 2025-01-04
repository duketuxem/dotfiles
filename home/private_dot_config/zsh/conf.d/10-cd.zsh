# ============================================================================
# Change Directory
# ============================================================================

### Navigation
setopt AUTOCD               # cd to the given path without cd as a prefix
setopt AUTOPUSHD            # all 'cd's goes to the directory stack history
setopt PUSHDIGNOREDUPS		# only remember the location, not the order

# TODO: Replace the following with a fish-like prevd/nextd plugin custom or not
alias s='dirs -v | sed 11q'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
