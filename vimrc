function! g:Include(file)
  if filereadable(expand(a:file))
    execute 'source' a:file
  endif
endfunction

command! Reload execute "source $MYVIMRC"

" Stolen wholesale from gabebw, who stole it wholesale from christoomey, whose
" dotfiles you really should check out:
" https://github.com/christoomey/dotfiles
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    call Include(config_file)
  endfor
endfunction

" ============================================================================
" PLUGINS {{{
" ============================================================================

" Using vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" ==========
" Completion
" ==========

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'mitsuse/autocomplete-swift'

" ======
" Search
" ======

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" ==========
" Git/GitHub
" ==========

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-conflicted'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" ====
" Tmux
" ====

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" ====================
" Languages/Frameworks
" ====================

Plug 'raichoo/haskell-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'elixir-lang/vim-elixir'
Plug 'c-brenn/phoenix.vim'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lambdatoast/elm.vim'
Plug 'keith/swift.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-markdown'

" ==========
" Appearance
" ==========

Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'

" =======
" Writing
" =======

Plug 'nicholaides/words-to-avoid.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" ====
" Misc
" ====

" Asynchronous file linting/formatting
Plug 'w0rp/ale'
" Language agnostic testing support
Plug 'janko-m/vim-test'
" Work with Xcode projects from inside Vim
Plug 'gfontenot/vim-xcode'
" Easily comment code
Plug 'tpope/vim-commentary'
" Allow . to make plugin actions repeat
Plug 'tpope/vim-repeat'
" Surround text objects with characters
Plug 'tpope/vim-surround'
" Project specific configurations
Plug 'tpope/vim-projectionist'
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
" Quickly add attachments to emails
" Also checks for emails that _should_ have attachments but don't.
Plug 'chrisbra/CheckAttach'

call plug#end()
" }}}

call s:SourceConfigFilesIn('config')
call s:SourceConfigFilesIn('functions')

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

" Source local vimrc if we're in a safe repo
call Include('./.git/safe/../../.vimrc')
