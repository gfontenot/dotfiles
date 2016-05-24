let g:xcode_run_command = 'VtrSendCommandToRunner! {cmd}'
let g:xcode_xcpretty_testing_flags = '--test'

nnoremap <leader>b :XBuild<CR>
nnoremap <leader>u :XTest<CR>

nnoremap <leader>om :e %<.m<CR>
nnoremap <leader>vm :vsp %<.m<CR>
nnoremap <leader>oh :e %<.h<CR>
nnoremap <leader>vh :vsp %<.h<CR>
