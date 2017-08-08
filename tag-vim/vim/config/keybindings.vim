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

command! ToggleCheckbox call <sid>toggle_checkbox()

function! s:toggle_checkbox()
  let current_line = getline('.')
  let cursor_pos = getpos('.')
  if match(current_line, '\V[ ]') >= 0
    exe 's/\V[ ]/[x]/'
  elseif match(current_line, '\V[x]') >= 0
    exe 's/\V[x]/[ ]/'
  endif
  call setpos('.', cursor_pos)
endfunction

nnoremap <leader>. :ToggleCheckbox<Cr>
