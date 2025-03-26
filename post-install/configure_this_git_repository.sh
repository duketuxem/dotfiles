#!/usr/bin/env sh

git_name="Duke Tuxem"
git_email="33418846+DukeTuxem@users.noreply.github.com"
git_username="duketuxem"

cd "$HOME/.local/share/chezmoi" || exit 1

git remote set-url origin "git@github.com:$git_username/dotfiles.git" && \
echo "Repository URL set to use ssh with username: '$git_username'"

git config user.name "$git_name" && \
echo "Repository user name set to: '$git_name'"

git config user.email "$git_email" && \
echo "Repository user mail set to: '$git_email'"

# To undo:
# git config --local --remove-section user
# git remote set-url origin https://github.com/duketuxem/dotfiles
