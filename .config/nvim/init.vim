set nocompatible

let mapleader = "\<Space>"

set shell=zsh

set tw=0

filetype off

set clipboard=unnamedplus

set backspace=indent,eol,start

set guicursor=

set clipboard+=unnamedplus

set number relativenumber

nnoremap c "_c

set hlsearch

set cpoptions+=n

set numberwidth=4

set wildmode=longest,list,full

filetype plugin indent on

let python_highlight_all=1

let g:sneak#label = 1

syntax on

set encoding=utf-8

set cursorline
set cursorcolumn


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

let g:sneak#label = 1

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

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
