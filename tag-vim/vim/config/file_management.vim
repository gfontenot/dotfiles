command! -complete=file -nargs=1
      \ Remove
      \ call delete(<f-args>) | bdelete!
