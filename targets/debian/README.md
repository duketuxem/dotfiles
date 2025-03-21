# Instructions for Debian

### Optional: Enable Debian Testing for less outdated packages

Skip this section if you are already satisfied with the default stable release.

See the [Debian documentation](https://wiki.debian.org/DebianTesting#How_to_install_Debian_.28next-stable.29_Testing) otherwise.

## Installation

```sh
# Prefer some recent packages over the defaults
./apt.sh

# Install the core packages
sudo apt-get install $(<debian_core.txt)

# If relevant, install the desktop packages
sudo apt-get install $(<debian_desktop.txt)
```
