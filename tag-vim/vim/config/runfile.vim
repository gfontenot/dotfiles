let g:runfile_by_name = {
  \ '.*\.m\(ark\)\?d\(own\)\?$': '!open -a "Marked" %',
  \ '.*\.hs': '!cabal repl %',
  \ }

map <leader>r :Run<CR>
