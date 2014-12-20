#!/usr/bin/env zsh
git config --global core.excludesfile ~/.gitignore

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.l "log --pretty=format:'%C(red)#%h%Creset%C(yellow)%d%Creset %C(blue)%cd%Creset %C(green)%s%Creset%C(magenta)[%cn]%Creset' --date=short --graph"

git config --global color.ui true
echo "[Enter name used for git]:"
read name
git config --global user.name $name
echo "[Enter email address used for git]:"
read email
git config --global user.email $email