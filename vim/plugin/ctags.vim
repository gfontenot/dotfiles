command! Ctags call ctags#generate()

function! g:ctags#generate()
  call system("git ls-files | ctags -L -")
endfunction
