command! Jopen call g:jira#open()

function! g:jira#open()
  let l:url = g:jira_root_domain . expand('<cWORD>')
  call netrw#BrowseX(l:url, 0)
endfunction

nnoremap gj :Jopen<CR>
