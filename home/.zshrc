# config git completion
zstyle ':completion:*:*:git:*' script $HOME/.dotfiles/shell/git-completion.sh
fpath=($HOME/.dotfiles/shell $fpath)
autoload -Uz compinit && compinit -i

# config prompt
source $HOME/.dotfiles/shell/git-prompt.sh
precmd () { __git_ps1 "%n" ":%~$ " "|(%s)" }