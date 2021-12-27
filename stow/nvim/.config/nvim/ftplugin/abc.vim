" ftplugin/abc.vim

" FUNCTIONS "
" abc#getNotes takes text input and returns an array of abc notes, each split
" into an array containing their note value and length value.
function abc#getNotes(input)
    let l:notes=[]
    let l:noteParts=[]
    call substitute(a:input,
                \ '\([_=\^]\)\?\a\([,'']\)*\/\?\([0-9]\)*',
                \ '\=add(l:notes, submatch(0))',
                \ 'g')
    for l:note in range(0, len(l:notes) - 1)
        let l:noteTmp=[]
        call substitute(l:notes[l:note],
                    \ '\zs\([_=\^]\)\?\a\([,'']\)*\ze\/\?\([0-9]\)*',
                    \ '\=add(l:noteTmp, submatch(0))',
                    \ 'g')
        call substitute(l:notes[l:note],
                    \ '\([_=\^]\)\?\a\([,'']\)*\zs\/\?\([0-9]\)*\ze',
                    \ '\=add(l:noteTmp, submatch(0))',
                    \ 'g')
        call add(l:noteParts, l:noteTmp)
    endfor
    return l:noteParts
endfunction

" MAPPINGS "
map <silent> <leader>vv :!abcm2ps -O - "%" \| ps2pdf - \| zathura -<CR><CR>
map <silent> <leader>vl :!abcm2ps -lO - "%" \| ps2pdf - \| zathura -<CR><CR>
