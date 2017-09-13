" Remove the file for the current buffer
command! -complete=file -nargs=?
      \ Delete
      \ call file#delete(<f-args>)

" Move the current file to a different directory
command! -complete=dir -nargs=1
      \ MoveFile
      \ call file#move(<f-args>)

function! g:file#delete(...)
  if empty(a:000)
    let filename = @%
  else
    let filename = join(a:000)
  endif

  call delete(filename) | bdelete!
endfunction

function! g:file#move(new_dir)
  let old_name = expand('%')
  let file_name = expand('%:t')
  let target_dir = a:new_dir =~ '\/$' ? a:new_dir : a:new_dir . '/'

  if !isdirectory(target_dir)
    call mkdir(target_dir, 'p')
  endif

  let new_name = target_dir . file_name
  exec 'saveas ' . new_name
  call delete(old_name)
endfunction
