#!/usr/bin/env sh

repos_root_folder="$HOME/workspace/repos"

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
	fi
	return 0
}

# =============================================================================

# Install the suckless suite
if [ ! -d "$repos_root_folder" ]; then
	error "$repos_root_folder not found."
fi
cd "$repos_root_folder" || exit 1

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

	printf "Installing %s...\n" "$soft"
	if ! git clone "$custom_git_repo_https/$soft" \
		|| ! cd "$soft" \
		|| ! sudo make install \
		|| ! git remote add upstream "$suckless_git_upstream/$soft.git" \
		|| ! git remote set-url origin "$custom_git_repo_ssh/$soft.git" \
		|| ! make clean \
		|| ! cd ..; then
			error "Setup failed for $soft"
	fi
done
