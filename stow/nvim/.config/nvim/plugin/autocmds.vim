" Autocmds

" Focus autocmds
        " TODO: Prevent running on NERDTree/UndoTree
autocmd BufEnter,FocusGained,VimEnter,WinEnter * call focus#focus()
autocmd FocusLost,WinLeave * call focus#dim()
