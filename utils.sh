# Script sourced from both install_packages.sh and install-window-manager.sh


# =============================================================================
# Color-coded logging functions
# =============================================================================

log()
{
	printf '%s' "$*"
}

error()
{
	printf '\033[0;1;31m%s\033[0m\n' "$*" # red
}

success()
{
	printf '\033[0;1;32m%s\033[0m\n' "$*" # green
}

warning()
{
	printf '\033[0;1;33m%s\033[0m\n' "$*" # yellow
}

info()
{
	printf '\033[0;1;34m%s\033[0m\n' "$*" # blue
}

step()
{
	printf '\033[0;1;35m%s\033[0m\n' "$*" # purple
}

fatal()
{
	error "$1\n"
	exit 1
}


# =============================================================================
# Utility functions
# =============================================================================

# Check if a command exists and is executable (mind aliases and functions)
# This is copied from: https://github.com/dylanaraps/pfetch
has()
{
	_cmd=$(command -v "$1") 2>/dev/null || return 1
	[ -x "$_cmd" ] || return 1
}

# Prompt the user with a yes/no question
# Usage:
# if ask "Question" -> error (user said no)
ask()
{
	printf "%s [Y/n] " "$1"
	read -r answer
	if [ -z "$answer" ] || [ "$answer" = "y" ] || [ "$answer" = "Y" ]
	then
		return 1
	else
		return 0
	fi
}

# Count the number of elements in a list
count()
{
	# disable globbing to ensure the word-splitting is safe.
	set -f
	# populate the positional parameters with the elements of the list
	set -- $1
	# print each list value on its own line.
	printf '%s\n' "$#"
	# re-enable globbing.
	set +f
}

# Split a string into a list, one element per line
split()
{
	# disable globbing to ensure the word-splitting is safe.
	set -f
	# safe to disable as it just warns against
	# word-splitting which is the behavior we expect.
	# shellcheck disable=2086
	set -- $1

	# print each list value on its own line.
	printf '%s\n' "$@"

	# re-enable globbing.
	set +f
}

# Check if the argument is a number
is_number()
{
	case $1 in
		''|*[!0-9]*) return 1 ;;
		*) return 0 ;;
	esac
}


# =============================================================================
# System functions
# =============================================================================
#
# Try two linux flavor detection methods :
# - eval ID="distro_name" to check it later in the script
# - To be implemented: parsing lsb_release output
# If the first one is working then the second is skipped.
detect_linux()
{
	no_osrelease=0
	no_lsbrelease=0

	if [ ! -f '/etc/os-release' ]
	then
		no_osrelease=1
		echo "$0: Can not find /etc/os-release."
	else
		echo "$0: Parsing /etc/os-release"
		# TODO: know if 'ID' is present everywhere
		distro=$(grep '^ID' /etc/os-release | sed s/ID/distro/)
		# echo $distro
		eval "$distro"
		echo "$0: Found '$distro'"
	fi

	if [ "$no_osrelease" -eq 1 ]
	then
		if ! has lsb_release
		then
			no_lsbrelease=1
			echo "$0: No lsb_release command available."
		else
			# TODO:
			echo "$0: TODO: Need to parse lsb_release -a"
		fi
		echo "lsb_release's output parsing is not implemented, the script will exit"
		exit 2
	fi

	if [ "$no_osrelease" -eq 1 ] && [ "$no_lsbrelease" -eq 1 ]
	then
		echo "$0: Error, can not identify Linux flavor"
		# TODO: Implement fallback after lsb_release ?
		exit 1
	fi

	unset no_osrelease no_lsbrelease
}
