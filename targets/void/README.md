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

## Notes

### Missing terminal description for tmux out of the box

The `ncurse-term` package is needed in order to let tmux find the correct
terminal description for its `default-terminal` setting: tmux-256color.
