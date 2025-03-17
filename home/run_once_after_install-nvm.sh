#!/usr/bin/env bash

# Do not alter any user shell configuration thanks to $PROFILE
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash'

# NVM_DIR should normally be set but still just in case
export NVM_DIR="${NVM_DIR:-$HOME/config/nvm}"

# Source the nvm 'env' so `node` commands will be available
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts && \
	npm install -g typescript
