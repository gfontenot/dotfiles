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


" By default, gx uses "<cfile>", which only reads up til the first dot:
" https://github.com -> https://github
" This remaps gx to instead use "<cWORD>", which uses a full WORD.
" Shamelessly stolen from @gabebw
" https://github.com/gabebw/dotfiles/commit/cb1062c9533f29a2cfdcecfbfad50e4d16584636
nnoremap gx :call netrw#BrowseX('<C-R>=expand("<cWORD>")<CR>', 0)<CR>
