augroup startup
  autocmd!

  " If we launched vim without specifying a target, we want to open the pwd
  autocmd VimEnter * if empty(argv()) | silent! edit . | endif

  " recreate the spelling dictionary at startup
  autocmd VimEnter * execute "silent mkspell! ~/.vim/spell/en.utf-8.add"
augroup END
