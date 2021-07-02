" Focus

function! focus#focus() abort
    if &buftype == ''
        call statusline#focus()
        setlocal number relativenumber
    else
        call statusline#specialfocus()
    endif
endfunction

function! focus#dim() abort
    if &buftype == ''
        call statusline#dim()
        setlocal number norelativenumber
    else
        call statusline#specialdim()
    endif
endfunction
