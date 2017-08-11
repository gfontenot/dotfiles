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

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['swift'] = ['swiftformat']
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '[%linter%]: %s'
