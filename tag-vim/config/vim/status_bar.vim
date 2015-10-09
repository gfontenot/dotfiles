Plugin 'itchyny/lightline.vim'

" Show the status line all the time
set laststatus=2

let g:lightline = { 'colorscheme': 'wombat' }

let g:lightline.active = {
      \   'right': [
      \      ['filetype']
      \   ]
\}

let g:lightline.inactive = { 'right': [ ] }
