#!/usr/bin/env bash

# Do not alter any user shell configuration thanks to $PROFILE
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash'

# Note:
# Even if NVM_DIR is set in zshrc, nvm.sh does not exist, so it is not sourced.
# After a fresh install, it needs to be sourced for the next commands to work,
# and for this running script only.
# Every other time is handled in zshrc with that same following instruction,
# and this is why it tells you reload your shell...
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Support until 2027
nvm install --lts=jod && \
	npm install -g bash-language-server \
	npm install -g typescript \
	npm install -g typescript-language-server \
	npm install -g vim-language-server
