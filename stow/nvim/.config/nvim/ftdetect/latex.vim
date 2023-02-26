function! latex#skeleton() abort
    let l:skel = "\\documentclass{}\<nl>\<nl>"
             \ . "\\author{}\<nl>"
             \ . "\\title{}\<nl>\<nl>"
             \ . "\\begin{document}\<nl>\<nl>\<nl>\<nl>"
             \ . "\\end{document}""
    0put = l:skel
    norm ggf}
endfunction


augroup autocmds#latex
    au!
    autocmd BufNewFile *.tex call latex#skeleton()
augroup END
