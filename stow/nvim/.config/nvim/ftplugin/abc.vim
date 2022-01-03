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

function! abc#getNotation(original, new)
    let l:wholeNotes=[]
    for l:note in range(0, len(a:new) - 1)
         let l:wholeNoteTmp = a:new[l:note][0] . a:new[l:note][1]
         call add(l:wholeNotes, l:wholeNoteTmp)
    endfor
    let l:originalNotes=[]
    call substitute(a:original,
                \ '\([_=\^]\)\?\a\([,'']\)*\/\?\([0-9]\)*',
                \ '\=add(l:originalNotes, submatch(0))',
                \ 'g')
    let l:abcNotation=a:original
    let l:abcReturn=''
    for l:note in range(0, len(l:originalNotes) - 1)
        let l:abcNotation = substitute(l:abcNotation,
                    \ l:originalNotes[l:note],
                    \ l:wholeNotes[l:note],
                    \ '')
        let l:split = matchend(l:abcNotation, l:wholeNotes[l:note])
        let l:abcReturn = l:abcReturn . l:abcNotation[0:l:split - 1]
        let abcNotation = l:abcNotation[l:split:strlen(l:abcNotation) - 1]
    endfor
    return l:abcReturn
endfunction

function! abc#lengthDouble(input)
    let l:notes = abc#getNotes(a:input)
    for l:note in range(0, len(l:notes) - 1)
        if (l:notes[l:note][1] == '^/*') " TODO: Fix this regex
            if (l:notes[l:note][1] == '/')
                let l:notes[l:note][1] = ''
            elseif (l:notes[l:note][1] == '/'[0-9])
                let l:notes[l:note][1] = ''
            else
                let l:notes[l:note][1] = l:notes[l:note][1] / 2
            endif
        elseif (l:notes[l:note][1] == '')
            let l:notes[l:note][1] = 2
        else
            let l:notes[l:note][1] = l:notes[l:note][1] * 2
        endif
    endfor
    return abc#getNotation(a:input, l:notes)
endfunction

" MAPPINGS "
map <silent> <leader>vv :!abcm2ps -O - "%" \| ps2pdf - \| zathura -<CR><CR>
map <silent> <leader>vl :!abcm2ps -lO - "%" \| ps2pdf - \| zathura -<CR><CR>
