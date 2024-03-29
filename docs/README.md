# Dotfiles

My dotfiles repo, intended as a personal backup.


## Usage Instructions

On the system where it is to be installed:

+ `echo 'alias d="/usr/bin/git --git-dir=$HOME/dl/git/dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc` or `.bashrc`
+ `source ~/.zshrc` or `.bashrc`
+ `git clone --bare https://www.github.com/mistersmee/dotfiles.git $HOME/dl/git/dotfiles`
+ `d checkout`
+ `d config --local status.showUntrackedFiles no`

## Copyright
 ```
  /*
  *  Copyright (C) 2020-21 Aseem Athale
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
Copy of the GNU GPL located at `docs/license` in the repository.
All files in this repository are under the GPL and the copyright is held by me, unless specifically stated otherwise.
