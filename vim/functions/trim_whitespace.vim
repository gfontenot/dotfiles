command! TrimWhitespace call s:trim_whitespace()

function! s:trim_whitespace()
  let l:pos = getpos(".")
  %s/\s\+$//g
  call setpos(".", l:pos)
endfunction
