augroup startup
  autocmd!

  " If we launched vim without specifying a target, we want to open the pwd
  autocmd VimEnter * if empty(argv()) | silent! edit . | endif
augroup END
