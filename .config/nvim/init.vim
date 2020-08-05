set nocompatible
set shell=zsh
set tw=0
set clipboard=unnamedplus
set backspace=indent,eol,start
set guicursor=
set clipboard+=unnamedplus
set number relativenumber
set hlsearch
set cpoptions+=n
set numberwidth=4
set wildmode=longest,list,full
set encoding=utf-8
set cursorline
set cursorcolumn

syntax on

filetype plugin indent on
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin  'tpope/vim-eunuch'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'sheerun/vim-polyglot'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'ap/vim-css-color'
call vundle#end()

if &diff
	 highlight! link DiffText MatchParen
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

nnoremap ,g :Goyo <CR>
nnoremap ,G :Goyo! <CR>
nnoremap ,ZZ :SudoWrite <CR>
nnoremap c "_c
