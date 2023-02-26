" Autocmds

" automatically resize splits when vim is resized
augroup autocmd#window
    au!
    autocmd VimResized * wincmd =
augroup END

" delete trailing lines and whitespace
function autocmds#trailfunc() abort
    let l:curpos = getpos(".")
    silent! %s/\s\+$//e
    silent! v/\_s*\S/d
    nohlsearch
    call setpos(".", l:curpos)
endfunction

augroup autocmd#trailing
    au!
    autocmd BufWritePre * call autocmds#trailfunc()
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

" Exit autocmds
augroup autocmds#exit
    au!
    autocmd VimLeave * lua vim.fn.system([[tmux set status on]])
augroup END
