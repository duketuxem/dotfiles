#!/usr/bin/env bash

echo "--> Add the release PGP keys:"
if [ ! -d /etc/apt/keyrings ]; then
	echo "Missing /etc/apt/keyrings folder"
	sudo mkdir -p /etc/apt/keyrings || exit 1
	echo "Folder created."
else
	echo "Already existing /etc/apt/keyrings directory"
fi

if [ ! -f /etc/apt/keyrings/syncthing-archive-keyring.gpg ]; then
	sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg || exit 1
	echo "Syncthing release key retrieved succesfully"
else
	echo "Key already exists, skipping"
fi

if ! grep "sync" /etc/apt/sources.list.d/syncthing.list > /dev/null; then
	# Add the "stable" channel to your APT sources:
	echo "Adding Syncthing repos to APT"
	echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
fi

sudo apt-get update
