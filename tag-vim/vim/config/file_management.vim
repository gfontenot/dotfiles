command! -complete=file -nargs=?
      \ Remove
      \ call <sid>remove(<f-args>)

function! s:remove(...)
  if empty(a:000)
    let filename = @%
  else
    let filename = join(a:000)
  endif

  call delete(filename) | bdelete!
endfunction
