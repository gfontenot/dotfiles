let g:runfile_by_name = {
  \ '.*\.m\(ark\)\?d\(own\)\?$': '!open -a "Marked 2" %',
  \ '.*\.hs': '!cabal repl %',
  \ }

map <leader>r :Run<CR>
