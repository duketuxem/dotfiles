#!/usr/bin/env sh

chezmoi execute-template < ./run_install-packages.sh.tmpl > script.sh && \
	chmod +x script.sh && ./script.sh
