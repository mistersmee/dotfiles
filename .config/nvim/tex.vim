autocmd BufRead,BufNewFile *.tex set filetype=tex

let g:livepreview_previewer = 'kitty -e zathura'
let g:livepreview_use_biber = 1
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %
