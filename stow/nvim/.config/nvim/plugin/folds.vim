" Folds

function! folds#foldtext() abort
    let l:lines=(v:foldend - v:foldstart + 1) . 'ℓ'
    let l:first=substitute(getline(v:foldstart), '\v *', '', '',)
    let l:dashes=substitute(v:folddashes, '-', '›', 'g')
    return l:dashes . '·' .  '«' . l:lines . '»' . '·' . '«' . l:first . '»'
endfunction

set foldtext=folds#foldtext()
