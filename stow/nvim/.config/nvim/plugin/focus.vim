" Focus

function! focus#focus() abort
        call statusline#focus()
        call colorcolumn#focus()
        setlocal relativenumber
endfunction

function! focus#dim() abort
        call statusline#dim()
        call colorcolumn#dim()
        setlocal norelativenumber
endfunction
