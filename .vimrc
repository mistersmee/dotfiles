set nocompatible
set shell=zsh
set tw=0
filetype on
set clipboard=unnamedplus
set backspace=indent,eol,start
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor=
set clipboard+=unnamedplus
set number relativenumber
nnoremap c "_c
set nohlsearch
filetype plugin on
set cpoptions+=n
set numberwidth=4
set wildmode=longest,list,full
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'python-mode/python-mode'
Plugin 'mattn/emmet-vim'
Plugin 'lervag/vimtex'
Plugin 'justinmk/vim-sneak'
Plugin 'pearofducks/ansible-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'trevordmiller/nova-vim'
Plugin 'tpope/vim-surround'
Plugin 'preservim/nerdtree'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'jreybert/vimagit'
Plugin 'lukesmithxyz/vimling'
Plugin 'vimwiki/vimwiki'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'kovetskiy/sxhkd-vim'
Plugin 'ap/vim-css-color'
call vundle#end()
filetype plugin indent on
let python_highlight_all=1



" Mappings
nmap ;g :Goyo<CR>
map q <Nop>
map Q <Nop>
map ,c :lcl<CR> :pc<CR> :cclose<CR>
" Nerd tree
 	map <leader>n :NERDTreeToggle<CR>
 	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")&& b:NERDTree.isTabTree()) | q | endif
       if has('vim')
 		let NERDTreeBookmarksFile = stdpath('data') .'/NERDTreeBookmarks'
	else
		let NERDTreeBookmarksFile = '~/.vim' .'/NERDTreeBookmarks'
	endif


" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
 	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
 	nm <leader>i :call ToggleIPA()<CR>
 	imap <leader>i <esc>:call ToggleIPA()<CR>a
 	nm <leader>q :call ToggleProse()<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
 	map <leader>o :setlocal spell! spelllang=en_us<CR>
"
" 	" Splits open at the bottom and right, which is non-retarded, unlike
" 	vim defaults.
 	set splitbelow splitright



" Python
let g:pymode_python = 'python3'
:let mapleader = ","
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_complete_on_dot = 1


" Misc settings
let g:goyo_width = "80%"
let g:goyo_height = "80%"

let g:vimtex_compiler_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'okular'
set nu
syntax on
set laststatus=2
set background=dark
colorscheme default
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
au BufNewFile,BufRead *.md
    \ Goyo |
    \ hi StatusLineNC ctermfg=white |
    \ set nonu |
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
set encoding=utf-8
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
hi StatusLine ctermbg=none cterm=bold

" Shortcutting split navigation, saving a keypress:
 	map <C-h> <C-w>h
 	map <C-j> <C-w>j
 	map <C-k> <C-w>k
 	map <C-l> <C-w>l

" Replace ex mode with gq
 	map Q gq

" Check file in shellcheck:
 	map <leader>s :!clear && shellcheck %<CR>

" Enable Goyo by default for mutt writing
 	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
 	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
 	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ:Goyo\|x!<CR>
 	autocmd BufRead,BufNewFile /tmp/neomutt* mapZQ :Goyo\|q!<CR>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
map <leader>p :!opout <c-r>%<CR><CR


if &diff
	 highlight! link DiffText MatchParen
endif
