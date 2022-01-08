" markdown.vim

" Autorun
Prose

" Functions
function! markdown#autoList() abort
    if getline(".") =~ '^-$'
        return '  -'
    else
        return '-'
    endif
endfunction

function! markdown#fixTable() range
    execute (a:firstline + 1) . 's/-/ /g'
    execute a:firstline . ',' . a:lastline . 'Tabularize /|'
    execute (a:firstline + 1) . 's/ /-/g'
endfunction

" Abbreviations
iabbrev <expr> - markdown#autoList()

" Mappings
vnoremap t :'<,'>call markdown#fixTable()<CR>
