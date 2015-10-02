set spellfile=~/.vim/spell/en.utf-8.add

augroup spellcheck
  autocmd!

  autocmd FileType text setlocal spell
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
  autocmd FileType mail setlocal spell
augroup END
