" Toggle markdown checkboxes
function! g:checkbox#toggle()
  let current_line = getline('.')
  let cursor_pos = getpos('.')
  if match(current_line, '\V[ ]') >= 0
    exe 's/\V[ ]/[x]/'
  elseif match(current_line, '\V[x]') >= 0
    exe 's/\V[x]/[ ]/'
  endif
  call setpos('.', cursor_pos)
endfunction
