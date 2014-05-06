augroup filetypes
  autocmd!

  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
  autocmd BufNewFile,BufRead *.muttrc set filetype=muttrc
  autocmd BufNewFile,BufRead *liftoffrc set filetype=yaml
  autocmd BufNewFile,BufRead PULLREQ_EDITMSG set filetype=gitcommit
augroup END
