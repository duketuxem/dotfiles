# Instructions for Void

## Installation

```sh
# Install the core packages
sudo xbps-install $(<void_core.txt)

# If relevant, install the desktop packages
sudo xbps-install $(<void_desktop.txt)

# Create the XDG_RUNTIME_DIR if it doesn't exist
./create-xdg-runtime-dir.sh
```
