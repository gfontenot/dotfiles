Plugin 'Keithbsmiley/swift.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'nicholaides/words-to-avoid.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'pbrisbin/vim-rename-file'
Plugin 'raichoo/haskell-vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

Plugin 'christoomey/vim-tmux-navigator'

" Markdown
Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['swift', 'ruby', 'sh', 'yaml', 'objc', 'haskell']

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

" Runfile
Plugin 'pbrisbin/vim-runfile'
let g:runfile_by_name = {
  \ '.*Gemfile$': '!bundle',
  \ '.*\.m\(ark\)\?d\(own\)\?$': '!open -a "Marked" %',
  \ '.*\.hs': '!cabal repl %',
  \ }
map <leader>r :Run<CR>
