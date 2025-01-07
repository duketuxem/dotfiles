## fzf-powered bookmark navigation (plugin)
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
	local compute() {
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
		local err=0
		for fav in "$@"; do
			compute "$(realpath -- "$fav")"
			[ $? -gt 0 ] && err=1
		done
		unset fav
		return $err
	fi
}

delfav() {
	local compute() {
		# Deleting line if it exists
		if grep -Fxq "$1" "$CDFAVS"; then
			echo "Deleting '$1' from favorites."
			local filtered_file=$(grep -Fvx "$1" "$CDFAVS")
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
		local err=0
		for fav in "$@"; do
			compute "$(realpath -- "$fav")"
			[ $? -gt 0 ] && err=1
		done
		unset fav
		return $err
	fi
}

# Parse all favorite directories and clean unexisting entries
chkfav() {
	local to_del=()
	# IFS= (or '') prevents leading/trailing whitespace from being trimmed.
	# -r prevents backslash escapes from being interpreted.
	while IFS='' read -r local fileline
	do
		[ ! -d "$fileline" ] && to_del+=("$fileline")
	done < "$CDFAVS"

	for fav in $to_del; do
		delfav "$fav"
	done
	local err=$?
	unset fav
	return $err
}