" Keybindings
nnoremap <leader>g :Goyo <CR>
nnoremap <leader>G :Goyo! <CR>
nnoremap <leader>l <c-w>w
nnoremap <leader>s z=
nnoremap <leader>t :tabe <CR>
nnoremap c "_c
"
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>
