#!/usr/bin/env sh

# TODO: Test
# Generate help tags for plugins installed in the vim pack folder
vim -c ':helptags ALL | q'
