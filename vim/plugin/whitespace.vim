" Trim trailing whitespace from files
command! TrimWhitespace call g:whitespace#trim()

function! g:whitespace#trim()
  let l:pos = getpos(".")
  %s/\s\+$//g
  call setpos(".", l:pos)
endfunction
