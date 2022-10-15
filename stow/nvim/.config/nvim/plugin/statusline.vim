" Statusline

" This function shamelessly stolen from Greg Hurrell (wincent).
function! statusline#gutterpadding() abort
    let l:minwidth=2
    let l:gutterWidth=max([strlen(line('$')) + 1, &numberwidth, l:minwidth])
    let l:padding=repeat(' ', l:gutterWidth)
    return l:padding
endfunction

" This and the following function are stolen from https://kadekillary.work/post/statusline-vim/
let g:currentmode={ 'n' : 'normal',
            \'v' : 'visual',
            \'V' : 'visual',
            \'^V' : 'visual',
            \'i' : 'insert',
            \'R' : 'replace',
            \'Rv' : 'replace',
            \'c' : 'command',
            \'t' : 'terminal'}

function! statusline#modecurrent() abort
    let l:modecurrent = mode()
    let l:modelist = get(g:currentmode, l:modecurrent, 'visual')
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Focus functions
function! statusline#focus() abort
    setlocal statusline=
    setlocal statusline+=%#SLNormalColour#%{(statusline#modecurrent()=='normal'&&!&modified)?statusline#gutterpadding():''}
    setlocal statusline+=%#SLModified#%{(statusline#modecurrent()=='normal'&&&modified)?statusline#gutterpadding():''}
    setlocal statusline+=%#SLInsertColour#%{(statusline#modecurrent()=='insert')?statusline#gutterpadding():''}
    setlocal statusline+=%#SLVisualColour#%{(statusline#modecurrent()=='visual')?statusline#gutterpadding():''}
    setlocal statusline+=%#SLReplaceColour#%{(statusline#modecurrent()=='replace')?statusline#gutterpadding():''}
    setlocal statusline+=%#SLCommandColour#%{(statusline#modecurrent()=='command')?statusline#gutterpadding():''}
    setlocal statusline+=%#SLTerminalColour#%{(statusline#modecurrent()=='terminal')?statusline#gutterpadding():''}
    setlocal statusline+=%#SLSeperator#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileName#
    setlocal statusline+=%t
    setlocal statusline+=\ %#SLSeperator2#
    setlocal statusline+=▏
    setlocal statusline+=%<
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
    setlocal statusline+=%2l
    setlocal statusline+=%#SLLineColText#
    setlocal statusline+=ℓ
    setlocal statusline+=%#SLSeperator#
    setlocal statusline+=│
    setlocal statusline+=%#SLLineCol#
    setlocal statusline+=%2v
    setlocal statusline+=%#SLLineColText#
    setlocal statusline+=𝒸
    setlocal statusline+=%#SLSeperator#
    setlocal statusline+=│
    setlocal statusline+=%#SLPercent#
    setlocal statusline+=%3.3p%%
endfunction

function! statusline#dim() abort
    setlocal statusline=
    setlocal statusline+=%#SLModified#%{&modified?statusline#gutterpadding():''}
    setlocal statusline+=%#SLNormalColourDim#%{!&modified?statusline#gutterpadding():''}
    setlocal statusline+=%#SLSeperatorDim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileNameDim#
    setlocal statusline+=%t
    setlocal statusline+=\ %#SLSeperator2Dim#
    setlocal statusline+=▏
    setlocal statusline+=%<
    setlocal statusline+=%#SLFilePathDim#
    setlocal statusline+=%F
    setlocal statusline+=\ %#SLMidDim#
    setlocal statusline+=▏
    setlocal statusline+=%=
    setlocal statusline+=%#SLSeperator3Dim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileTypeDim#
    setlocal statusline+=%Y
    setlocal statusline+=\ %#SLSeperator2Dim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLLineColDim#
    setlocal statusline+=%2l
    setlocal statusline+=%#SLLineColTextDim#
    setlocal statusline+=ℓ
    setlocal statusline+=%#SLSeperator2Dim#
    setlocal statusline+=│
    setlocal statusline+=%#SLLineColDim#
    setlocal statusline+=%2v
    setlocal statusline+=%#SLLineColTextDim#
    setlocal statusline+=𝒸
    setlocal statusline+=%#SLSeperator2Dim#
    setlocal statusline+=│
    setlocal statusline+=%#SLPercentDim#
    setlocal statusline+=%3.3p%%
endfunction

function! statusline#specialfocus() abort
    setlocal statusline=
    setlocal statusline+=%#SLSeperator2#
    setlocal statusline+=\ \ %#SLSeperator#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileName#
    setlocal statusline+=%t
    setlocal statusline+=\ %#SLSeperator2#
    setlocal statusline+=▏
    setlocal statusline+=%<
endfunction

function! statusline#specialdim() abort
    setlocal statusline=
    setlocal statusline+=%#SLMidDim#
    setlocal statusline+=\ \ %#SLSeperatorDim#
    setlocal statusline+=▏
    setlocal statusline+=%#SLFileNameDim#
    setlocal statusline+=%t
    setlocal statusline+=\ %#SLMidDim#
    setlocal statusline+=▏
    setlocal statusline+=%<
endfunction

" Statusline Colours
hi statusline                ctermbg=237 ctermfg=0  cterm=NONE   guibg=#3a3a3a guifg=#282828 gui=NONE
    " Normal
        hi SLSeperator       ctermbg=15  ctermfg=0  cterm=NONE   guibg=#ebdbb2 guifg=#282828 gui=NONE
        hi SLFileName        ctermbg=15  ctermfg=0  cterm=bold   guibg=#ebdbb2 guifg=#282828 gui=bold
        hi SLSeperator2      ctermbg=7   ctermfg=0  cterm=NONE   guibg=#a89984 guifg=#282828 gui=NONE
        hi SLFilePath        ctermbg=7   ctermfg=0  cterm=italic guibg=#a89984 guifg=#282828 gui=italic
        hi SLMid             ctermbg=239 ctermfg=0  cterm=NONE   guibg=#4e4e4e guifg=#282828 gui=NONE
        hi SLSeperator3      ctermbg=7   ctermfg=0  cterm=NONE   guibg=#a89984 guifg=#282828 gui=NONE
        hi SLFileType        ctermbg=7   ctermfg=0  cterm=NONE   guibg=#a89984 guifg=#282828 gui=NONE
        hi SLLineCol         ctermbg=15  ctermfg=0  cterm=italic guibg=#ebdbb2 guifg=#282828 gui=italic
        hi SLLineColText     ctermbg=15  ctermfg=0  cterm=NONE   guibg=#ebdbb2 guifg=#282828 gui=NONE
        hi SLPercent         ctermbg=15  ctermfg=0  cterm=bold   guibg=#ebdbb2 guifg=#282828 gui=bold

    " Dim
        hi SLModeDim         ctermbg=237 ctermfg=9  cterm=NONE   guibg=#3a3a3a guifg=#fb4934 gui=NONE
        hi SLSeperatorDim    ctermbg=239 ctermfg=0  cterm=NONE   guibg=#4e4e4e guifg=#282828 gui=NONE
        hi SLFileNameDim     ctermbg=239 ctermfg=15 cterm=NONE   guibg=#4e4e4e guifg=#ebdbb2 gui=NONE
        hi SLSeperator2Dim   ctermbg=237 ctermfg=0  cterm=NONE   guibg=#3a3a3a guifg=#282828 gui=NONE
        hi SLFilePathDim     ctermbg=237 ctermfg=7  cterm=italic guibg=#3a3a3a guifg=#a89984 gui=italic
        hi SLMidDim          ctermbg=237 ctermfg=0  cterm=NONE   guibg=#3a3a3a guifg=#282828 gui=NONE
        hi SLSeperator3Dim   ctermbg=237 ctermfg=0  cterm=NONE   guibg=#3a3a3a guifg=#282828 gui=NONE
        hi SLFileTypeDim     ctermbg=237 ctermfg=7  cterm=NONE   guibg=#3a3a3a guifg=#a89984 gui=NONE
        hi SLLineColDim      ctermbg=237 ctermfg=7  cterm=italic guibg=#3a3a3a guifg=#a89984 gui=italic
        hi SLLineColTextDim  ctermbg=237 ctermfg=7  cterm=NONE   guibg=#3a3a3a guifg=#a89984 gui=NONE
        hi SLPercentDim      ctermbg=237 ctermfg=7  cterm=NONE   guibg=#3a3a3a guifg=#a89984 gui=NONE

    " Variable
        hi SLNormalColour    ctermbg=15  ctermfg=0  cterm=NONE   guibg=#ebdbb2 guifg=#282828 gui=NONE
        hi SLNormalColourDim ctermbg=237 ctermfg=0  cterm=NONE   guibg=#3a3a3a guifg=#282828 gui=NONE
        hi SLInsertColour    ctermbg=3   ctermfg=0  cterm=NONE   guibg=#d79921 guifg=#282828 gui=NONE
        hi SLReplaceColour   ctermbg=166 ctermfg=0  cterm=NONE   guibg=#d75f00 guifg=#282828 gui=NONE
        hi SLVisualColour    ctermbg=4   ctermfg=0  cterm=NONE   guibg=#458588 guifg=#282828 gui=NONE
        hi SLCommandColour   ctermbg=0   ctermfg=0  cterm=NONE   guibg=#282828 guifg=#282828 gui=NONE
        hi SLTerminalColour  ctermbg=15  ctermfg=0  cterm=NONE   guibg=#ebdbb2 guifg=#282828 gui=NONE
        hi SLModified        ctermbg=1   ctermfg=0  cterm=NONE   guibg=#cc241d guifg=#282828 gui=NONE
