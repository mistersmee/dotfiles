# alarm-dots

My dotfiles, intended as personal backup.


# Usage Instructions

On the system where it is to be installed:

+ `echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc` or `.bashrc`
+ `source ~/.zshrc` or `.bashrc`
+ `echo ".dotfiles.git" >> .gitignore`
+ `git clone --bare https://www.github.com/mistersmee/dotfiles.git $HOME/.dotfiles.git`
+ `dotfiles checkout`
+ `dotfiles config --local status.showUntrackedFiles no`

On the original system

+ `git init --bare $HOME/.dotfiles.git`
+ `echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc` or `.bashrc`
+ `source ~/.zshrc` `.bashrc`
+ `dotfiles config --local status.showUntrackedFiles no`
