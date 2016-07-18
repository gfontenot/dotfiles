let g:xcode_runner_command = 'VtrSendCommandToRunner! {cmd}'
let g:xcode_xcpretty_testing_flags = '--test'

nnoremap <leader>b :Xbuild<CR>
nnoremap <leader>u :Xtest<CR>

nnoremap <leader>om :e %<.m<CR>
nnoremap <leader>vm :vsp %<.m<CR>
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>vh :vsp %<.h<CR>
