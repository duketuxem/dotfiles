#!/usr/bin/env sh

# =============================================================================
# Script init
# =============================================================================

# POSIX syntax to source a file
. ./utils.sh

# Disabling git interactive prompts allows for testing a repository existence
# Must be set this way to 'close stdin' (required by check_git_repository)
GIT_ASKPASS="echo"
SSH_ASKPASS="echo"


# =============================================================================
# User variables
# =============================================================================

suckless_git_upstream="https://git.suckless.org/"

custom_git_repo_https="https://github.com/duketuxem"
custom_git_repo_ssh="git@github.com:duketuxem"
software_list="dmenu dwm st"
forks_dir="$HOME/workspace/repos"

fonts_dir="$HOME/.local/share/fonts"


# =============================================================================
# Checks
# =============================================================================

err=0

check_repo_existence()
{
	printf 'Checking if the '\''%s'\'' repository exists... ' "$1"
	# --exit-code allows the command to fail if the branch is incorrect
	if ! git ls-remote --exit-code "$1" > /dev/null 2>&1
	then
		error "The repository $1 does not seem to exist"
		err=1
	else
		success "OK!"
	fi
}

for soft in $(split "$software_list")
do
	check_repo_existence "$custom_git_repo_https/$soft"
done

[ $err -eq 1 ] && fatal "One or more repository is incorrect"


# =============================================================================
# Install
# =============================================================================

setup_desktop()
{
	for soft in $(split "$software_list")
	do
		info "Installing $soft..."
		git clone "$custom_git_repo_https/$soft" \
			&& cd "$soft" \
			&& "$1" make install \
			&& git remote add upstream "$suckless_git_upstream/$soft.git" \
			&& git remote set-url origin "$custom_git_repo_ssh/$soft.git" \
			&& make clean \
			&& cd ..
	done


}

setup_fonts()
{
	curl -fLo "CodeNewRomanNerdFont-Regular.otf" \
		https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/CodeNewRoman/Regular/CodeNewRomanNerdFont-Regular.otf
}

operating_system="$(uname -s)"
if [ "$operating_system" = 'Linux' ]
then
	cd "$forks_dir"		|| fatal "Can not cd to: $forks_dir"
	setup_desktop "sudo"	|| fatal "Something went wrong"

	cd "$fonts_dir"		|| fatal "Can not cd to: $fonts_dir"
	setup_fonts		|| fatal "Could not install font(s)"

elif [ "$operating_system" = "FreeBSD" ]
then
	cd "$forks_dir"		|| fatal "Can not cd to: $forks_dir"
	setup_desktop "doas"	|| fatal "Something went wrong"

	cd "$fonts_dir"		|| fatal "Can not cd to: $fonts_dir"
	setup_fonts		|| fatal "Could not install font(s)"
else
	error "Unsupported platform for now"
	return 1
fi

success "Done!"
return 0
