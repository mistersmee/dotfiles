set nocompatible
let mapleader = ","
set shell=zsh
set termguicolors
set tw=0
filetype on
set backspace=indent,eol,start
set guicursor=
set clipboard=unnamedplus
set number relativenumber
set hlsearch
set cpoptions+=n
set numberwidth=4
set wildmode=longest,list,full
set encoding=utf-8
set cursorline
set cursorcolumn
set rtp+=~/.config/vim/bundle/Vundle.vim
call vundle#begin('~/.config/vim/bundle/')
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin  'tpope/vim-eunuch'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'sheerun/vim-polyglot'
Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'
Plugin 'lifepillar/vim-solarized8'
Plugin 'vimwiki/vimwiki'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'ap/vim-css-color'
Bundle 'ron89/thesaurus_query.vim'
call vundle#end()
filetype plugin on
filetype plugin indent on
syntax on
set background=dark
colorscheme solarized8 
let g:solarized_extra_hi_groups = 1
let g:solarized_termtrans = 1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" vimwiki settings
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki'}]
"
"" Keybindings
nnoremap <leader>g :Goyo <CR>
nnoremap <leader>G :Goyo! <CR>
nnoremap <leader>ZZ :SudoWrite <CR>
nnoremap <leader>l <c-w>w
nnoremap <leader>s z=
nnoremap c "_c
nnoremap <leader>p :%s/i686/pentium4/gc <CR>
nnoremap <leader>P :%s/x86_64/pentium4/gc <CR>
