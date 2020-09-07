""Basic vim settings
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

"" Spell check
set spelllang=en_gb
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell


"' Vundle vim plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin  'tpope/vim-eunuch'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'sheerun/vim-polyglot'
Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'ap/vim-css-color'
Bundle 'ron89/thesaurus_query.vim'
call vundle#end()

""colorscheme solarized
syntax on 
filetype plugin indent on
filetype on
set background=dark
colorscheme solarized
call togglebg#map("<F6>")
"" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

"" Keybindings
nnoremap ,g :Goyo <CR>
nnoremap ,G :Goyo! <CR>
nnoremap ,ZZ :SudoWrite <CR>
nnoremap ,l <c-w>w
nnoremap ,cs :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap ,cs y:ThesaurusQueryReplace <C-r>"<CR>
nnoremap c "_c
