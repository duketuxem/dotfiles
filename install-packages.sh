#!/usr/bin/env sh

script=$(chezmoi execute-template < ./"$0".tmpl)

[ ! -z "$script" ] && eval "$script"
