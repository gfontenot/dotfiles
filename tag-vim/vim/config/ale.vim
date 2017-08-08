let g:ale_linters = {
      \ 'haskell': ['hlint', 'stack-build']
      \ }

augroup AleConfig
  autocmd!
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
augroup END

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
