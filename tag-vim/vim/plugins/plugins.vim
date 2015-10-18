" Baseic defaults
Plug 'tpope/vim-sensible'

" Fuzzy finder for files
Plug 'kien/ctrlp.vim'

" Automatically create non-existent directories
Plug 'pbrisbin/vim-mkdir'

" Rename files in place
Plug 'pbrisbin/vim-rename-file'

" Easily comment code
Plug 'tpope/vim-commentary'

" Automatically add closing statements for a number of languages
Plug 'tpope/vim-endwise'

" Allow . to make plugin actions repeat
Plug 'tpope/vim-repeat'

" Surround text objects with characters
Plug 'tpope/vim-surround'

" Remember last position in files
Plug 'dietsche/vim-lastplace'

" Intelligent tab completion
Plug 'ervandew/supertab'

" Dash support
Plug 'Keithbsmiley/investigate.vim'
let g:investigate_use_dash=1

" Runfile
Plug 'pbrisbin/vim-runfile'
let g:runfile_by_name = {
  \ '.*\.m\(ark\)\?d\(own\)\?$': '!open -a "Marked" %',
  \ '.*\.hs': '!cabal repl %',
  \ }
map <leader>r :Run<CR>
