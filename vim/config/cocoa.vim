" Cocoa specific plugins
" Bundle 'msanders/cocoa.vim'
" Bundle 'Rip-Rip/clang_complete'
" Bundle 'llvm-mirror/lldb', {'rtp': 'utils/vim-lldb'}

au BufNewFile,BufRead *.m set filetype=objc
au BufNewFile,BufRead *.h set filetype=objc
au FileType objc setlocal tabstop=4
au FileType objc setlocal shiftwidth=4
