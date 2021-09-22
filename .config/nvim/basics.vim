""Basic Vim settings
let mapleader = ";"
set guicursor=
set autoindent
set smartindent
set cindent
set list lcs=tab:\|\ 
set autoread
set backspace=indent,eol,start
set expandtab
set smarttab
set hidden
set termguicolors
set clipboard+=unnamedplus
set number relativenumber
set wildmode=longest,list,full
set smartcase
set encoding=utf-8
set cursorline
set cursorcolumn

" Automatically remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
