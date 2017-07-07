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
