" Fuzzy finder for files
Plugin 'kien/ctrlp.vim'

" Automatically create non-existent directories
Plugin 'pbrisbin/vim-mkdir'

" Rename files in place
Plugin 'pbrisbin/vim-rename-file'

" Easily comment code
Plugin 'tpope/vim-commentary'

" Automatically add closing statements for a number of languages
Plugin 'tpope/vim-endwise'

" Allow . to make plugin actions repeat
Plugin 'tpope/vim-repeat'

" Surround text objects with characters
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
