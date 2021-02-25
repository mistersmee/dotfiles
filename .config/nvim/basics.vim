""Basic Vim settings
let mapleader = ";"
set guicursor=
set termguicolors
set clipboard+=unnamedplus
set number relativenumber
set wildmode=longest,list,full
set smartcase
set encoding=utf-8
"set cursorline
"set cursorcolumn

" Automatically remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %
