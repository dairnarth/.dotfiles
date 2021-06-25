" Focus

function! focus#focus() abort
    call statusline#focus()
    call colorcolumn#focus()
endfunction

function! focus#dim() abort
    call statusline#dim()
    call colorcolumn#dim()
endfunction
