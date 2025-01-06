# ============================================================================
# Navigation
# ============================================================================

## Options
setopt NOAUTOCD         # require cd for directories (history + no ambiguity)
setopt AUTOPUSHD        # all 'cd's goes to the dir stack history
setopt PUSHDIGNOREDUPS  # only remember the location, not the order

## Directory stack
# A quick cd "history":
# usage: `s` to show the dir stack, any number for quick cd previous/next
alias s='dirs -v | sed 11q'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

## fzf-powered bookmark navigation
# note: no need to export, every zsh interactive shell will know this variable,
# as this file is sourced inevitably.
# The only use case would be for another program or script run externally,
# like a zsh script, run from my interactive shell, that would then not see it.
# But it's not necessary since it's meant to be used only here.
CDFAVS="$XDG_DATA_HOME"/zsh/favs.txt

alias cdf='eval cd $(fzf < $CDFAVS)'
alias efav="$EDITOR $CDFAVS"
alias favs="$PAGER $CDFAVS"
alias f="favs"

addfav () {
        compute() {
                # Do not add an invalid folder or a duplicate entry
                if [ ! -d "$1" ]; then
                        echo >&2 "'$1' is not a valid directory."
                        return 1
                elif grep -Fxq "$1" "$CDFAVS"; then
                        echo >&2 "'$1' is already in favorites."
                        return 1
                fi

                # Add the directory to the favorites file and keep it sorted
                echo "$1" >> "$CDFAVS" && sort -uo "$CDFAVS" "$CDFAVS"
                echo "Added '$1' to favorites."
        }

        # No argument given: add the current folder
        if [ "$#" -eq 0 ]; then
                compute $(realpath "$PWD")
                return $?
        # Add as many valid directories as given
        else
                err=0
                for fav in "$@"; do
                        compute "$(realpath -- "$fav")"
                        [ $? -gt 0 ] && err=1
                done
                return $err
        fi
}

delfav() {
        compute() {
                # Deleting line if it exists
                if grep -Fxq "$1" "$CDFAVS"; then
                        echo "Deleting '$1' from favorites."
                        filtered_file=$(grep -Fvx "$1" "$CDFAVS")
                        echo "$filtered_file" > "$CDFAVS"
                        return 0
                fi
                echo >&2 "Directory '$1' not found in the list."
                return 1
        }

        # No argument: try to delete the current directory
        if [ "$#" -eq 0 ]; then
                compute $(realpath "$PWD")
                return $?
        # Delete as many valid favorites directories as given
        else
                err=0
                for fav in "$@"; do
                        compute "$(realpath -- "$fav")"
                        [ $? -gt 0 ] && err=1
                done
                return $err
        fi
}

# Parse all favorite directories and clean unexisting entries
chkfav() {
        to_del=()
        # IFS= (or '') prevents leading/trailing whitespace from being trimmed.
        # -r prevents backslash escapes from being interpreted.
        while IFS='' read -r fileline
        do
                [ ! -d "$fileline" ] && to_del+=("$fileline")
        done < "$CDFAVS"

        for fav in $to_del; do
                delfav "$fav"
        done
        return $?
}
