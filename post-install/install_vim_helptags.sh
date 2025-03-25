#!/usr/bin/env sh

# Generate help tags for plugins installed in the vim pack folder
vim -c ':helptags ALL | q'
