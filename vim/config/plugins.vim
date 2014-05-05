" Required
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'nicholaides/words-to-avoid.vim'

Plugin 'pbrisbin/vim-rename-file'

" Markdown
Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['ruby', 'sh', 'yaml', 'objc', 'haskell']

" Gist support
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_show_privates = 1
let g:gist_post_private = 1

" Dash support
Plugin 'Keithbsmiley/investigate.vim'
let g:investigate_use_dash=1

" Hardtime
Plugin 'takac/vim-hardtime'
let g:hardtime_default_on = 1
