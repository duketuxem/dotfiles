#!/usr/bin/env sh

# script run as root (su):
priv="sudo"
repos_root_folder="$HOME/workspace/repos"

# script run as sudo/doas:
# priv=""
# repos_root_folder="/tmp"

# -------------------------------------

fonts_dir="/usr/share/fonts/"
suckless_git_upstream="https://git.suckless.org/"
custom_git_repo_https="https://github.com/duketuxem"
custom_git_repo_ssh="git@github.com:duketuxem"
software_list="dmenu dwm st"


# Utils
error() {
	printf '\033[0;1;31m%s\033[0m\n' "$*" # red
    exit 1
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


check_git_repository()
{
	if ! git ls-remote --exit-code "$1" > /dev/null 2>&1
	then
		error "\nThe repository $1 does not seem to exist"
        # this is not in use anymore since error exits 1
		#return 1
	fi
    return 0
}

setup_code_new()
{
    if [ ! -d "$fonts_dir" ]; then
        error "Fonts directory does not exist"
    fi
    cd "$fonts_dir"

	if [ -f "CodeNewRomanNerdFont-Regular.otf" ]
	then
		printf "Font CodeNewRoman already present, skipping download...\n"
	else
		"$priv" curl -fLo "CodeNewRomanNerdFont-Regular.otf" \
			https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/CodeNewRoman/Regular/CodeNewRomanNerdFont-Regular.otf
	fi
	# Is this needed ?: fc-cache -fv
}

setup_forks()
{
	for soft in $(split "$software_list")
	do
		if ! check_git_repository "$custom_git_repo_https/$soft"
		then
			error "Can not find the repository for $soft..."
		fi

		if [ -d "$soft" ]
		then
			print "Folder $soft already exists, skipping...\n"
		fi

		printf "Installing $soft...\n"
		if ! git clone "$custom_git_repo_https/$soft" \
			|| ! cd "$soft" \
			|| ! "$priv" make install \
			|| ! git remote add upstream "$suckless_git_upstream/$soft.git" \
			|| ! git remote set-url origin "$custom_git_repo_ssh/$soft.git" \
			|| ! make clean \
			|| ! cd ..; then
				error "Setup failed for $soft"
		fi
	done
}

# =============================================================================

# Install font
setup_code_new

# Install the suckless suite
if [ ! -d "$repos_root_folder" ]; then
    error "$repos_root_folder not found."
fi
cd "$repos_root_folder"

setup_forks