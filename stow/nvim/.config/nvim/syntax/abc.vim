" syntax/abc.vim

"if b:current_syntax == 'abc'
"    syntax clear
"endif
if exists("b:current_syntax")
  finish
endif

syn match  abcNote      "[_=\^]\{,2}[A-G],*[1-9]*\d*"                                       contained
syn match  abcNote      "[_=\^]\{,2}[A-G],*[1-9]*\d*/[248]\="                               contained
syn match  abcNote      "[_=\^]\{,2}[a-g]'*[1-9]*\d*"                                       contained
syn match  abcNote      "[_=\^]\{,2}[a-g]'*[1-9]*\d*/[248]\="                               contained

syn match  abcRest      "z[1-9]*\d*"                                                        contained
syn match  abcRest      "z[1-9]*\d*/[248]\="                                                contained
syn match  abcRest      "Z[1-9]*\d*"                                                        contained

syn match  abcEmpty     "x[1-9]*\d*"                                                        contained
syn match  abcEmpty     "x[1-9]*\d*/[248]\="                                                contained

syn match  abcSpacer    "y[1-9]*\d*"                                                        contained

syn match  abcBar       "|\(\d*,*-*\)*"                                                     contained
syn match  abcBar       "\[|"                                                               contained
syn match  abcBar       "|\]"                                                               contained
syn match  abcBar       "[:|][:|]\(\d*,*-*\)*"                                              contained
syn match  abcBar       "\[\d\(\d*,*-*\)*"                                                  contained

syn match  abcOrnament  "[\.~HLMOPSTuv]"                                                    contained
syn match  abcOrnament  "!\(\a\|\.\)*!"                                                     contained
syn match  abcOrnament  "![0-5]!"                                                           contained
syn match  abcOrnament  "![+^>]!"                                                           contained
syn match  abcOrnament  "![<>][()]!"                                                        contained

syn match  abcTuple     "([1-9]\+:\=[0-9]*:\=[0-9]*"                                        contained
syn match  abcBroken    "<\|<<\|<<<\|>\|>>\|>>>"                                            contained
syn match  abcTie       "-"                                                                 contained

syn region abcChord     start='"(\?[A-G]' end='"'                                           contained

syn region abcText      start='"[<>_\^@]' end='"'                                           contained

syn match  abcHeadField "^[A-DF-IK-WXZmr]:.*$"                                              contained
syn match  abcBodyField "^[IK-NP-RT-Wmrsw]:.*$"                                             contained
syn match  abcBodyField "\[[IK-NP-RUVmrw]:[A-Za-z0-9!\"#£$%&'()*+, -./:;<=>?@[\^_`{|}~]*\]" contained

syn region abcHeader    start="^X:"       end="^K:.*$"                                      contained
  \ contains=abcHeadField,abcComment keepend
syn region abcTune      start="^X:"       end="^ *$"
  \ contains=abcHeader,abcComment,abcBar,abcNote,abcRest,abcEmpty,abcSpacer,abcBodyField,abcChord,abcOrnament,abcTuple,abcBroken,abcTie,abcText

syn match  abcComment   "%.*$"

hi def link abcComment   Comment
hi def link abcHeadField Type
hi def link abcBodyField Special
hi def link abcBar       Statement
hi def link abcTuple     Statement
hi def link abcBroken    Statement
hi def link abcTie       Statement
hi def link abcChord     Identifier
hi def link abcText      Normal
hi def link abcNote      Constant
hi def link abcRest      Comment
hi def link abcEmpty     Comment
hi def link abcSpacer    Comment
hi def link abcOrnament  Structure

let b:current_syntax = "abc"
