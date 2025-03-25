# On some non systemd distributions and/or without some session manager
# installed, (not sure about the exact case here), this directory might not be
# present but needs to exists for the XDG_RUNTIME_DIR variable.
# This was tested on voidlinux and the folder did not exist out of the box.

DIR_TO_BE_THERE="/run/user/$(id -u)"

if [ ! -d "$DIR_TO_BE_THERE" ]; then
	sudo mkdir "$DIR_TO_BE_THERE"
	sudo chown 700 "$DIR_TO_BE_THERE"
fi
