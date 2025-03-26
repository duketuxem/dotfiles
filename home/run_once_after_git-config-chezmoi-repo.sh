#!/usr/bin/env sh

git_username="duketuxem"
git_name="Duke Tuxem"
git_mail="33418846+DukeTuxem@users.noreply.github.com"

cd "$HOME/.local/share/chezmoi" || exit 1

git remote set-url origin "git@github.com:$git_username/dotfiles.git" && \
echo "Repository URL set to use ssh with username: '$git_username'"

git config user.name "$git_name" && \
echo "Repository user name set to: '$git_name'"

git config user.email "$git_mail" && \
echo "Repository user mail set to: '$git_mail'"

echo "hint: If you need, update the variables and re-run this script:"
echo "sh run_once_after_git-config-chezmoi-repo.sh"

