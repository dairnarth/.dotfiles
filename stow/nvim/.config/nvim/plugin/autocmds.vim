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

" Exit autocmds
augroup autocmds#exit
    au!
    autocmd VimLeave * lua vim.fn.system([[tmux set status on]])
augroup END
