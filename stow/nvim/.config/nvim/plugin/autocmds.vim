" Autocmds

" automatically resize splits when vim is resized
augroup autocmd#window
    au!
    autocmd VimResized * wincmd =
augroup END

" delete trailing whitespace
augroup autocmd#trailing
    au!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" adds formatting headers
        " TODO: Fix this...
augroup autocmds#groff
    au!
    autocmd BufNewFile *.mom 0put =\".PAPER A4\<nl>
        \.PRINTSTYLE TYPESET\<nl>
        \.L_MARGIN 2.5cm\<nl>
        \.R_MARGIN 2.5cm\<nl>
        \.DOCTYPE ___
        \\\#\<nl>
        \.FAMILY T\<nl>
        \.PT_SIZE 11\<nl>
        \.AUTOLEAD 1\<nl>
        \\\#\<nl>
        \.START\<nl>
        \\<nl>
        \\"|$
    autocmd BufWritePost *.mom silent! !pdfmom % > %:r.pdf
augroup END

augroup autocmds#latex
    au!
    autocmd BufNewFile *.tex 0put =\"\\documentclass{}\<nl>\<nl>
        \\\author{}\<nl>
        \\\title{}\<nl>
        \\<nl>
        \\\begin{document}\<nl>\<nl>\<nl>\<nl>
        \\\end{document}\"
        \| 1 | normal f}
    autocmd BufWritePost *.tex silent! !pdflatex "%"
augroup END

" Focus autocmds
augroup autocmds#focus
    au!
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * call focus#focus()
    autocmd FocusLost,WinLeave * call focus#dim()
augroup END

augroup autocmds#insert
    au!
    autocmd InsertEnter * set cursorline
    autocmd InsertLeave * set nocursorline
augroup END
