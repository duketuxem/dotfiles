#!/usr/bin/env zsh

chezmoi execute-template < ./run_install-packages.sh.tmpl > script.sh && ./script.sh
