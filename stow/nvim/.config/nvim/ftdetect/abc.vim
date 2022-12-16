" after/ftdetect/abc.vim

" FUNCTIONS "
function! abc#skeleton() abort
    let l:skel = "X:" . strftime("%y%m%d") . "\<nl>"
             \ . "T:" . expand("%:t:r") . "\<nl>"
             \ . "C:\<nl>S:\<nl>R:\<nl>M:\<nl>L:1/8\<nl>P:\<nl>K:\<nl>"
    0put = l:skel
    norm ggjj$
endfunction

" AUTOCMDS "
augroup abc#autocmds
    au!
    autocmd BufNewFile *.abc call abc#skeleton()
augroup END
