Plugin 'kien/ctrlp.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'pbrisbin/vim-rename-file'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Remember last position in files
Plugin 'dietsche/vim-lastplace'

" Intelligent tab completion
Plugin 'ervandew/supertab'

" Colorscheme
Plugin 'jonathanfilip/vim-lucius'

" Dash support
Plugin 'Keithbsmiley/investigate.vim'
let g:investigate_use_dash=1

" Runfile
Plugin 'pbrisbin/vim-runfile'
let g:runfile_by_name = {
  \ '.*\.m\(ark\)\?d\(own\)\?$': '!open -a "Marked" %',
  \ '.*\.hs': '!cabal repl %',
  \ }
map <leader>r :Run<CR>
