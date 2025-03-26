#!/usr/bin/env sh

# On some non systemd distributions and/or without some session manager
# installed, (not sure about the exact use case here), the following directory
# might not be present but needs to exist for using the XDG_RUNTIME_DIR
# variable. This was tested on voidlinux and the folder did not exist out of
# the box.

# For now the use case for this XDG_ variable is to use ssh-agent, that can
# remember your ssh key password for a defined amount of time.

USR_ID="$(id -u)"
DIR_TO_BE_THERE="/run/user/$USR_ID"

if [ ! -d "$DIR_TO_BE_THERE" ]; then
	echo "Creating the directory: $DIR_TO_BE_THERE"
	sudo mkdir "$DIR_TO_BE_THERE" || exit 1
	sudo chown "$USR_ID":"$USR_ID" "$DIR_TO_BE_THERE" || exit 1
	sudo chmod 700 "$DIR_TO_BE_THERE" || exit 1
	echo "Directory $DIR_TO_BE_THERE should now be there."
fi
