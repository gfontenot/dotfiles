Plugin 'gfontenot/vim-xcodebuild'

let g:xcodebuild_run_command = 'VtrSendCommandToRunner! {cmd}'
let g:xcodebuild_xcpretty_testing_flags = '--test'

nnoremap <leader>b :XBuild<CR>
nnoremap <leader>u :XTest<CR>
