" Focus

function! focus#focus() abort
        call statusline#focus()
        setlocal number relativenumber
endfunction

function! focus#dim() abort
        call statusline#dim()
        setlocal number norelativenumber
endfunction
