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

function! markdown#autoRef()
    let l:ref  = '[^' . expand("%:t:r") . ': '
    try
        redir => l:num
            exec '%s/\V' . l:ref . '//gn'
        redir END
    catch E486
        let l:num = '0 matches on 0 lines'
    endtry
    let l:num = substitute(
                \   substitute(
                \       substitute(
                \           l:num,
                \          '\(\S\+\s\).*',
                \          '\1',
                \          ''),
                \       '\s\+$',
                \       '',
                \       ''),
                \   '^\n',
                \   '',
                \   '')
                \ / 2 + 1
    let l:ref = l:ref . l:num . ']'
    return l:ref
endfunction

" Abbreviations
iabbrev <expr> - markdown#autoList()
"iabbrev [^] [^<C-r>=expand("%:t:r")<CR>: ]<left>
iabbrev [^] <esc>o<C-r>=markdown#autoRef()<CR><esc>kJ$mrGo<C-r>=markdown#autoRef()<CR>:

" Mappings
vnoremap t :'<,'>call markdown#fixTable()<CR>
map <buffer> <silent> <leader>vv :!md2pdf -o - "%" \| zathura -<CR><CR>
map <buffer> <silent> <leader>va :!nr<CR><CR>
