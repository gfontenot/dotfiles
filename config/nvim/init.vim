" ============================================================================
" PLUGINS {{{
" ============================================================================

" Using vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" ==========
" Completion
" ==========

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ======
" Search
" ======

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ====================
" Git/GitHub
" ====================

Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
Plug 'christoomey/vim-conflicted'
Plug 'gabebw/vim-github-link-opener', { 'branch': 'main' }
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ====
" Tmux
" ====

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" ====================
" Languages/Frameworks
" ====================

Plug 'sheerun/vim-polyglot'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'keith/swift.vim'

" ==========
" Appearance
" ==========

Plug 'itchyny/lightline.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'rakr/vim-one'
" Dim inactive splits
Plug 'TaDaa/vimade'

" =======
" Writing
" =======

Plug 'nicholaides/words-to-avoid.vim', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'dkarter/bullets.vim', { 'for': 'markdown' }

" ====
" Misc
" ====

" Asynchronous file linting/formatting
Plug 'w0rp/ale'
" Language agnostic testing support
Plug 'janko-m/vim-test'
" Work with Xcode projects from inside Vim
Plug 'gfontenot/vim-xcode', { 'branch': 'main', 'for': ['objc', 'swift'] }
" Extensable URL opener
Plug 'gfontenot/vim-url-opener', { 'branch': 'main' }
" Easily comment code
Plug 'tpope/vim-commentary'
" Allow . to make plugin actions repeat
Plug 'tpope/vim-repeat'
" Surround text objects with characters
Plug 'tpope/vim-surround'
" Convenient aliases for normal mode commands
Plug 'tpope/vim-unimpaired'
" Automatically create non-existent directories
Plug 'pbrisbin/vim-mkdir'
" Rename files in place
Plug 'pbrisbin/vim-rename-file'
" Easily copy to the system clipboard
Plug 'christoomey/vim-system-copy'
" Perform sort operations on text objects
Plug 'christoomey/vim-sort-motion'
" Automatically add closing statements for a number of languages
Plug 'cohama/lexima.vim'
" Remember last position in files
Plug 'dietsche/vim-lastplace'
" Allow for tmux-like split zooming
Plug 'dhruvasagar/vim-zoom'

call plug#end()

" Automatically install any plugins that aren't already installed when
" launching vim.
" https://github.com/junegunn/vim-plug/wiki/extra
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" }}}

" ============================================================================
" Appearance {{{
" ============================================================================

colorscheme one
set background=dark
let g:one_allow_italics = 1
set termguicolors

" Italics
highlight! Comment term=italic cterm=italic gui=italic
highlight! Todo term=italic cterm=italic gui=italic
highlight! link vimLineComment Comment
highlight! link gitcommitComment Comment


" Print the highlight-group info for the text under the cursor. This is
" helpful for when things aren't being formatted as expected.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set colorcolumn=80                " Highlight the 80 character column
set cursorline                    " Highlight the current line
set noshowmode                    " Don't show the current mode
set number                        " Also show the current line number
set relativenumber                " Use relative line numbers
set signcolumn=yes                " Always show the sign column

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" status bar
let g:lightline = { 'colorscheme': 'one' }

let g:lightline.active = {
      \   'right': [
      \      ['fugitive'],
      \      ['filetype'],
      \   ]
\}

let g:lightline.inactive = {
      \ 'right': [ ],
      \ 'left': [['filename', 'modified']]
      \ }

let g:lightline.component_function = {
      \  'fugitive': 'LightLineFugitive'
\}

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" }}}

" ============================================================================
" Splits {{{
" ============================================================================

" Open splits to the bottom right
set splitbelow
set splitright

nnoremap <silent> <C-W>z :call zoom#toggle()<CR>

" }}}

" ============================================================================
" Folds {{{
" ============================================================================

" Use indentation level by default
set foldmethod=indent

" Use marker folds for Vim filetypes
autocmd FileType vim setlocal foldmethod=marker

" Set the fold level super high so that files are unfolded by default
set foldlevel=99

" }}}

" ============================================================================
" Keybindings {{{
" ============================================================================

let mapleader = " "

" Map <leader><leader> to switch to previous file
nnoremap <leader><leader> <c-^>

" Set <leader>c to clear search highlighting
nnoremap <leader>c :noh<cr>

" Map <leader>v to open the current file in a vertical split and jump the
" original split back to the previous buffer
nnoremap <leader>v <C-^>:vsp #<Cr>

" Map <leader>x to open the current file in a horizontal split and jump the
" original split back to the previous buffer
nnoremap <leader>x <C-^>:sp #<Cr>

nnoremap <leader>. :call checkbox#toggle()<Cr>

" }}}

" ============================================================================
" Spellcheck {{{
" ============================================================================

set spellfile=~/.local/share/nvim/spell/en.utf-8.add

augroup spellcheck
  autocmd!

  " recreate the spelling dictionary at startup
  autocmd VimEnter * execute "silent mkspell! " . &spellfile
augroup END

" }}}

" ============================================================================
" Undo {{{
" ============================================================================

set undolevels=1000
set undoreload=10000

" }}}

" ============================================================================
" Search/Replace {{{
" ============================================================================

" default to global substitutions on lines
set gdefault
" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase
" Highlight matches.
set hlsearch
" Show all matches
set showmatch

" Clear search highlight when opening a file
autocmd BufReadCmd set nohlsearch

" Use Ag over Grep
set grepprg=ag\ --nogroup\ --nocolor

" Map Ag directly to \ for speeeed
nnoremap \ :Ag<SPACE>

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>

" Move the search term to the middle of the screen if the screen has changed
" position.
" Stolen from @keith:
" https://github.com/keith/dotfiles/commit/20f98a645dd9ebcd24fa96d3aac0e9fe34a21a6a
" https://github.com/keith/dotfiles/commit/38822fd4353909177ea8e49649156531736596e4
function! s:NextAndCenter(cmd)
  let view = winsaveview()

  try
    execute "normal! " . a:cmd
  catch /^Vim\%((\a\+)\)\=:E486/
    " Fake a 'rethrow' of an exception without causing a 3 line error message
    echohl ErrorMsg
    echo "E486: Pattern not found: " . @/
    echohl None
  endtry

  if view.topline != winsaveview().topline
    normal! zzzv
  endif
endfunction

nnoremap <silent> n :set hlsearch \| call <SID>NextAndCenter('n')<CR>
nnoremap <silent> N :set hlsearch \| call <SID>NextAndCenter('N')<CR>

" }}}

" ============================================================================
" Completion {{{
" ============================================================================

set wildmenu
set wildmode=list:longest,list:full
set completeopt=menu,menuone,longest,preview


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" }}}

" ============================================================================
" Snippets {{{
" ============================================================================

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

let g:neosnippet#snippets_directory = stdpath('data') . '/snippets'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" }}}

" ============================================================================
" Testing {{{
" ============================================================================

" Use VimTmuxRunner for our testing strategy
let test#strategy = 'vtr'

" Add keybindings for test actions
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tT :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" }}}

" ============================================================================
" Writing {{{
" ============================================================================

let g:markdown_fenced_languages =
      \ [ 'swift'
      \ , 'ruby'
      \ , 'sh'
      \ , 'yaml'
      \ , 'objc'
      \ , 'haskell'
      \ ]

let g:limelight_conceal_ctermfg = 'gray'

function! s:goyo_enter()
  if exists('$TMUX')
    " Turn off tmux statusline
    silent !tmux set status off

    " Zoom current pane to fullscreen
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif

  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    " Turn on tmux statusline
    silent !tmux set status on

    " Unzoom current pane if currently zoomed
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif

  set scrolloff=0
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}

" ============================================================================
" Ale {{{
" ============================================================================

let g:ale_echo_msg_format = '[%linter%]: %s'
" Show details for the violation under the cursor
let g:ale_cursor_detail = 1
" Show details in a floating window
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

" Set up initial dictionary so that I can add language-specific config later
let g:ale_linters = {}

" Fixer config
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['elm'] = ['elm-format']

let g:ale_fixers['haskell'] = ['brittany', 'hlint', 'stylish-haskell']
let g:ale_haskell_brittany_executable='stack'
let g:ale_haskell_hlint_executable='stack'
let g:ale_haskell_stylish_haskell_executable='stack'

" We're going to use COC for lsp features, so we should make sure that ALE
" doesn't conflict
let g:ale_disable_lsp = 1

" Disable linters covered by coc
let g:ale_linters['haskell']= []

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" }}}

" ============================================================================
" FZF {{{
" ============================================================================

" Display fzf in a floating window
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
" Search on top, results below
let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . "--reverse "

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Override default commands to include preview windows
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \   fzf#vim#with_preview(),
    \   <bang>0)

command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \   fzf#vim#with_preview(),
    \   <bang>0)

" Mimic ctrl-p because muscle memory
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" }}}

" ============================================================================
" Tmux {{{
" ============================================================================

let g:VtrGitCdUpOnOpen = 1

nnoremap <leader>ar :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>rr :VtrSendCommandToRunner! !!<cr>

nnoremap <leader>r :VtrSendCommandToRunner!<space>

" }}}

" ============================================================================
" URLs {{{
" ============================================================================

let g:url_transformers =
      \ [ 'jira#transform'
      \ ]

" }}}

" ============================================================================
" Git/GitHub {{{
" ============================================================================

let g:gist_post_private = 1
set stl+=%{ConflictedVersion()}

" }}}

" ============================================================================
" Xcode {{{
" ============================================================================

let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'
let g:xcode_xcpretty_testing_flags = '--test'

nnoremap <leader>b :Xbuild<CR>
nnoremap <leader>u :Xtest<CR>

" }}}

" ============================================================================
" Misc {{{
" ============================================================================

" Reload files on focus
autocmd FocusGained,BufEnter * :checktime

" Command to reload our vim config
command! Reload execute "source $MYVIMRC"

" Source a file if readable
function! g:Source(file)
  if filereadable(expand(a:file))
    execute 'source' a:file
  endif
endfunction

" We don't need pearl providers
let g:loaded_perl_provider = 0

" Automatically resize splits when the parent window size changes
autocmd VimResized * wincmd =

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Don't use swapfiles
set hidden                        " Don't kill unwritten buffers when hidden

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set wrap                          " Turn on line wrapping.
set nojoinspaces                  " Don't add two spaces after punctuation
                                  " when joining lines
" }}}

" Source private init.vim files that aren't tracked in this repo
call Source('~/.config/nvim/private/init.vim')

" Finally, source local vimrc files, but only if we're in a safe repo
call Source('./.git/safe/../../.vimrc')
