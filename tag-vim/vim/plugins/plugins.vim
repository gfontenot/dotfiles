if !has('nvim')
  " Basic defaults, not needed in nvim
  Plug 'tpope/vim-sensible'
endif

" Automatically create non-existent directories
Plug 'pbrisbin/vim-mkdir'

" Rename files in place
Plug 'pbrisbin/vim-rename-file'

" Easily comment code
Plug 'tpope/vim-commentary'

" Automatically add closing statements for a number of languages
Plug 'cohama/lexima.vim'

" Allow . to make plugin actions repeat
Plug 'tpope/vim-repeat'

" Surround text objects with characters
Plug 'tpope/vim-surround'

" Remember last position in files
Plug 'dietsche/vim-lastplace'

" Runfile
Plug 'pbrisbin/vim-runfile'

" Easily copy to the system clipboard
Plug 'christoomey/vim-system-copy'

" Taskpaper syntax and highlighting
Plug 'davidoc/taskpaper.vim'

" Perform sort operations on text objects
Plug 'christoomey/vim-sort-motion'

" Project specific configurations
Plug 'tpope/vim-projectionist'
