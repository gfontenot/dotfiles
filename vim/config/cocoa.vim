" Cocoa specific plugins
" Bundle 'msanders/cocoa.vim'
" Bundle 'Rip-Rip/clang_complete'
" Bundle 'llvm-mirror/lldb', {'rtp': 'utils/vim-lldb'}

augroup cocoa
  autocmd!

  autocmd BufNewFile,BufRead *.m set filetype=objc
  autocmd BufNewFile,BufRead *.h set filetype=objc
  autocmd FileType objc setlocal tabstop=4
  autocmd FileType objc setlocal shiftwidth=4
augroup END
