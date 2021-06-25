" Autocmds

" automatically resize splits when vim is resized
autocmd VimResized * wincmd =

" delete trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" adds formatting header to .mom files
        " TODO: Fix this...
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


" Focus autocmds
        " TODO: Prevent running on NERDTree/UndoTree
autocmd BufEnter,FocusGained,VimEnter,WinEnter * call focus#focus()
autocmd FocusLost,WinLeave * call focus#dim()
