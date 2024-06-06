setopt PROMPTSUBST	# Required for string interpolation in prompt

# autoload -Uz VCS_INFO

# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' formats       '%F{5}(%F{cyan}%b%F{5})%f'
# zstyle ':vcs_info:*' actionformats '%F{5}(%F{cyan}%b%F{3})%F{1}%a%F{5}]%f'
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
# # Enable checking for (un)staged changes, enabling use of %u and %c
# zstyle ':vcs_info:*' check-for-changes true
# # Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
# zstyle ':vcs_info:*' unstagedstr ' *'	# ongoing modifications
# zstyle ':vcs_info:*' stagedstr ' +'		# todo: push
# ✗



timer_show=
# Except when the shell is started, add one new line after each command.
precmd() {
	# Override the precmd() with the following function
	# which will then be executed after each command
	#precmd() {
	#    echo
	#}

	if [ $timer ]; then
		timer_show=$(($SECONDS - $timer)) # $SECONDS is an internal var
		unset timer
	fi
	# vcs_info
}

preexec() {
	timer=${timer:-$SECONDS}
}


# PROMPT == PS1
# %B/%b bold
# %F/%f color{red|green|blue|magenta|cyan|white}
PS1="%B"				# start bold mode
PS1="$PS1%F{green}%n"			# green username
PS1="$PS1%F{yellow}@"			# yellow @
PS1="$PS1%F{blue}%M "			# blue hostname
PS1="$PS1%F{magenta}%~ "		# magenta path
# PS1="$PS1%f%b\$vcs_info_msg_0_ "	# stop color & bold

PS1="$PS1%1(j.%F{yellow} %j .)%f"	# yellow background jobs
PS1="$PS1%(?.%F{green}√.%F{red}%?)%f"	# √ or fail code on the right

PS1="$PS1"$'\n'				# split prompt

PS1="$PS1%B%F{yellow} %b%f"		# prompt char itself


# TODO: tty depending prompt (with battery status, replacement of dwm...)
#cd ~/dwm
