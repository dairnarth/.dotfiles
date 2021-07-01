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

" adds formatting header to .mom files
        " TODO: Fix this...
augroup autocmds#newfile
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
augroup END


" Focus autocmds
        " TODO: Prevent running on NERDTree/UndoTree
augroup autocmds#focus
    au!
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * call focus#focus()
    autocmd FocusLost,WinLeave * call focus#dim()
augroup END
