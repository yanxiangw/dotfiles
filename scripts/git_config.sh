#!/usr/bin/env zsh
git config --global core.excludesfile ~/.gitignore

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.l "log --pretty=format:'%C(red)#%h%Creset%C(yellow)%d%Creset %C(blue)%cd%Creset %C(green)%s%Creset%C(magenta)[%cn]%Creset' --date=short --graph"

git config --global color.ui true