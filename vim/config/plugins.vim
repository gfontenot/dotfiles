" Required
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'nicholaides/words-to-avoid.vim'

" Markdown
Bundle 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['ruby', 'sh', 'yaml', 'objc', 'haskell']

" Gist support
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_show_privates = 1
let g:gist_post_private = 1

" Dash support
Bundle 'Keithbsmiley/investigate.vim'
let g:investigate_use_dash=1

" Hardtime
Bundle 'takac/vim-hardtime'
let g:hardtime_default_on = 1
