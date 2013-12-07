let mapleader = " "

nmap <leader>d <Plug>DashGlobalSearch

" Map <leader><leader> to switch to previous file
nnoremap <leader><leader> <c-^>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>

" Set <leader>c to clear search highlighting
nnoremap <leader>c :noh<cr>
