" ftplugin/abc.vim

" FUNCTIONS "
function! abc#run(abcInput, abcFunc, count = 1) abort
    let l:Func = function(a:abcFunc)
    let l:notes = abc#getNotes(a:abcInput)
    for i in range(1, a:count)
        let l:notes = l:Func(l:notes)
    endfor
    return abc#getNotation(a:abcInput, l:notes)
endfunction

" abc#getNotes takes text input and returns an array of abc notes, each split
" into an array containing their note value and length value.
function! abc#getNotes(abcInput)
    let l:notes=[]
    let l:noteParts=[]
    call substitute(a:abcInput,
                \ '\([_=\^]\)\{,2}\a\([,'']\)*\/\?\([0-9]\)*',
                \ '\=add(l:notes, submatch(0))',
                \ 'g')
    for l:note in range(0, len(l:notes) - 1)
        let l:noteTmp=[]
        call substitute(l:notes[l:note],
                    \ '\zs\([_=\^]\)\{,2}\a\([,'']\)*\ze\/\?\([0-9]\)*',
                    \ '\=add(l:noteTmp, submatch(0))',
                    \ 'g')
        call substitute(l:notes[l:note],
                    \ '\([_=\^]\)\{,2}\a\([,'']\)*\zs\/\?\([0-9]\)*\ze',
                    \ '\=add(l:noteTmp, submatch(0))',
                    \ 'g')
        call add(l:noteParts, l:noteTmp)
    endfor
    return l:noteParts
endfunction

function! abc#getNotation(abcInput, notelist)
    let l:wholeNotes=[]
    for l:note in range(0, len(a:notelist) - 1)
         let l:wholeNoteTmp = a:notelist[l:note][0] . a:notelist[l:note][1]
         call add(l:wholeNotes, l:wholeNoteTmp)
    endfor
    let l:abcInputNotes=[]
    call substitute(a:abcInput,
                \ '\([_=\^]\)\{,2}\a\([,'']\)*\/\?\([0-9]\)*',
                \ '\=add(l:abcInputNotes, submatch(0))',
                \ 'g')
    let l:abcNotation=a:abcInput
    let l:abcReturn=''
    for l:note in range(0, len(l:abcInputNotes) - 1)
        let l:abcNotation = substitute(l:abcNotation,
                    \ '\V' . l:abcInputNotes[l:note],
                    \ l:wholeNotes[l:note],
                    \ '')
        let l:split = matchend(l:abcNotation, '\V' . l:wholeNotes[l:note])
        let l:abcReturn = l:abcReturn . l:abcNotation[0:l:split - 1]
        let abcNotation = l:abcNotation[l:split:strlen(l:abcNotation) - 1]
    endfor
    return l:abcReturn
endfunction

function! abc#lengthDouble(notelist)
    let l:notes = a:notelist
    for l:note in range(0, len(l:notes) - 1)
        if (l:notes[l:note][1] =~ '^/') " TODO: Fix this regex
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
    return l:notes
endfunction

function! abc#transposeOctaveUp(notelist)
    let l:notes = a:notelist
    for l:note in range(0, len(l:notes) - 1)
        if l:notes[l:note][0] =~ ",$"
            let l:notes[l:note][0] = l:notes[l:note][0][0:-2]
        elseif l:notes[l:note][0] =~ '\u'
            let l:notes[l:note][0] = tolower(l:notes[l:note][0])
        else
            let l:notes[l:note][0] = l:notes[l:note][0] . "'"
        endif
    endfor
    return l:notes
endfunction

function! abc#transposeOctaveDown(notelist)
    let l:notes = a:notelist
    for l:note in range(0, len(l:notes) - 1)
        if l:notes[l:note][0] =~ "'$"
            let l:notes[l:note][0] = l:notes[l:note][0][0:-2]
        elseif l:notes[l:note][0] =~ '\l'
            let l:notes[l:note][0] = toupper(l:notes[l:note][0])
        else
            let l:notes[l:note][0] = l:notes[l:note][0] . ","
        endif
    endfor
    return l:notes
endfunction

" MAPPINGS "
map <silent> <leader>vv :!abcm2ps -O - "%" \| ps2pdf - \| zathura -<CR><CR>
map <silent> <leader>vl :!abcm2ps -lO - "%" \| ps2pdf - \| zathura -<CR><CR>
