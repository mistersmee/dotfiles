autocmd BufRead,BufNewFile *.tex set filetype=tex
"
" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %
