echo 'You might need to change your default shell to zsh: `chsh -s /bin/zsh` (or `sudo vim /etc/passwd`)'

dir="$HOME/.dotfiles"
mkdir -p $dir
git clone --recursive git://github.com/yanxiangw/dotfiles.git $dir
cd $dir
python mkdotfiles.py