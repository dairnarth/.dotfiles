" Statusline
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-V>" : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'Replace ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

" This function shamelessly stolen from Greg Hurrell (wincent).
function! statusline#gutterpadding() abort
    let l:minwidth=2
    let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth, l:minwidth])
    let l:padding=repeat(' ', l:gutterWidth - 2)
    return l:padding
endfunction

" Focus functions
function! statusline#focus() abort
    setlocal statusline=
    setlocal statusline+=%#SLMode#
    setlocal statusline+=%{statusline#gutterpadding()}
    setlocal statusline+=%{&modified?'\ ◉':'\ \ '}
    setlocal statusline+=\ %#SLSeperator#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileName#
    setlocal statusline+=%t
    setlocal statusline+=%<
    setlocal statusline+=\ %#SLSeperator2#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFilePath#
    setlocal statusline+=%F
    setlocal statusline+=\ %#SLMid#
    setlocal statusline+=▏
    setlocal statusline+=%=
    setlocal statusline+=%#SLSeperator3#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileType#
    setlocal statusline+=%Y
    setlocal statusline+=\ %#SLSeperator#
    setlocal statusline+=▏
    setlocal statusline+=%#SLLineCol#
    setlocal statusline+=%2lℓ
    setlocal statusline+=%#SLSeperator#
    setlocal statusline+=│
    setlocal statusline+=%#SLLineCol#
    setlocal statusline+=%2v𝒸
    setlocal statusline+=%#SLSeperator#
    setlocal statusline+=│
    setlocal statusline+=%#SLPercent#
    setlocal statusline+=%3.3p%%
endfunction

function! statusline#dim() abort
    setlocal statusline=
    setlocal statusline+=%#SLModeDim#
    setlocal statusline+=%{statusline#gutterpadding()}
    setlocal statusline+=%{&modified?'\ ◉':'\ \ '}
    setlocal statusline+=\ %#SLSeperatorDim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileNameDim#
    setlocal statusline+=%t
    setlocal statusline+=%<
    setlocal statusline+=\ %#SLSeperator2Dim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFilePathDim#
    setlocal statusline+=%F
    setlocal statusline+=\ %#SLMidDim#
    setlocal statusline+=▏
    setlocal statusline+=%=
    setlocal statusline+=%#SLSeperator3Dim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileTypeDim#
    setlocal statusline+=%Y
    setlocal statusline+=\ %#SLSeperatorDim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLLineColDim#
    setlocal statusline+=%2lℓ
    setlocal statusline+=%#SLSeperatorDim#
    setlocal statusline+=│
    setlocal statusline+=%#SLLineColDim#
    setlocal statusline+=%2v𝒸
    setlocal statusline+=%#SLSeperatorDim#
    setlocal statusline+=│
    setlocal statusline+=%#SLPercentDim#
    setlocal statusline+=%3.3p%%
endfunction

" Statusline Colours
highlight statusline ctermbg=15 ctermfg=0 cterm=NONE
    " Normal
        highlight SLMode ctermbg=15 ctermfg=0 cterm=NONE |
        highlight SLSeperator ctermbg=15 ctermfg=0 cterm=NONE |
        highlight SLFileName ctermbg=15 ctermfg=0 cterm=bold |
        highlight SLSeperator2 ctermbg=7 ctermfg=0 cterm=NONE |
        highlight SLFilePath ctermbg=7 ctermfg=0 cterm=italic |
        highlight SLMid ctermbg=239 ctermfg=0 cterm=NONE |
        highlight SLSeperator3 ctermbg=7 ctermfg=0 cterm=NONE |
        highlight SLFileType ctermbg=7 ctermfg=0 cterm=NONE |
        highlight SLLineCol ctermbg=15 ctermfg=0 cterm=italic |
        highlight SLPercent ctermbg=15 ctermfg=0 cterm=bold |

    " Dim
        highlight SLModeDim ctermbg=239 ctermfg=9 cterm=NONE |
        highlight SLSeperatorDim ctermbg=239 ctermfg=0 cterm=NONE |
        highlight SLFileNameDim ctermbg=239 ctermfg=15 cterm=NONE |
        highlight SLSeperator2Dim ctermbg=239 ctermfg=0 cterm=NONE |
        highlight SLFilePathDim ctermbg=239 ctermfg=7 cterm=italic |
        highlight SLMidDim ctermbg=239 ctermfg=0 cterm=NONE |
        highlight SLSeperator3Dim ctermbg=239 ctermfg=0 cterm=NONE |
        highlight SLFileTypeDim ctermbg=239 ctermfg=7 cterm=NONE |
        highlight SLLineColDim ctermbg=239 ctermfg=7 cterm=italic |
        highlight SLPercentDim ctermbg=239 ctermfg=7 cterm=NONE |

" Focus autocmds
        " TODO: Prevent running on NERDTree/UndoTree
autocmd BufEnter,FocusGained,VimEnter,WinEnter * call statusline#focus()
autocmd FocusLost,WinLeave * call statusline#dim()

" Mode autocmds
autocmd InsertEnter * highlight SLMode ctermbg=3 ctermfg=0
autocmd InsertLeave * highlight SLMode ctermbg=15 ctermfg=0
