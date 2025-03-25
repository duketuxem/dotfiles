# On some non systemd distributions and/or without some session manager
# installed, (not sure about the exact use case here), the following directory
# might not be present but needs to exists for the XDG_RUNTIME_DIR variable.
# This was tested on voidlinux and the folder did not exist out of the box.

USR_ID="$(id -u)"
DIR_TO_BE_THERE="/run/user/$USR_ID"

if [ ! -d "$DIR_TO_BE_THERE" ]; then
	sudo mkdir "$DIR_TO_BE_THERE"
	sudo chown "$USR_ID":"$USR_ID" "$DIR_TO_BE_THERE"
	sudo chmod 700 "$DIR_TO_BE_THERE"
fi
