let mapleader = " "

nnoremap <leader>d <Plug>DashGlobalSearch

" Map <leader><leader> to switch to previous file
nnoremap <leader><leader> <c-^>

" Tab mappings.
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>

" Set <leader>c to clear search highlighting
nnoremap <leader>c :noh<cr>

" System clipboard
map <leader>y "*Y
map <leader>p "*p<esc>
map <leader>P "*P<esc>
