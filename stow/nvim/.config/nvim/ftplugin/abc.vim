" ftplugin/abc.vim

" Functions
function abc#getNotes(input)
    let l:notes=[]
    call substitute(a:input,
                \ '\([_=\^]\)\?\a\([,'']\)*\/\?\([0-9]\)*',
                \ '\=add(l:notes, submatch(0))',
                \ 'g')
    return l:notes
endfunction

" Mappings
map <silent> <leader>vv :!abcm2ps -O - "%" \| ps2pdf - \| zathura -<CR><CR>
map <silent> <leader>vl :!abcm2ps -lO - "%" \| ps2pdf - \| zathura -<CR><CR>
