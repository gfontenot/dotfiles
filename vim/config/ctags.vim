command! Ctags call s:generate_ctags()

function! s:generate_ctags()
  call system("git ls-files | ctags -L -")
endfunction
