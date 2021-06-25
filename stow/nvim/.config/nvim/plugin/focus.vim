" Focus

function! focus#focus() abort
        call statusline#focus()
        call colorcolumn#focus()
        setlocal number relativenumber
endfunction

function! focus#dim() abort
        call statusline#dim()
        if winnr('$') > 2
            call colorcolumn#dim()
        endif
        setlocal number norelativenumber
endfunction
