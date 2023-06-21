function d --wraps git
    git --git-dir=$HOME/dl/git/dotfiles/ --work-tree=$HOME $argv
end
