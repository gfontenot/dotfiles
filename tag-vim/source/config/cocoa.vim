" Objective-C specific plugins and settings

let g:specta_highlight_expecta=1

Plugin 'Keithbsmiley/specta.vim'
Plugin 'b4winckler/vim-objc'
Plugin 'vim-scripts/Match-Bracket-for-Objective-C'

augroup cocoa
  autocmd!

  autocmd BufNewFile,BufRead *.m set filetype=objc
  autocmd BufNewFile,BufRead *.h set filetype=objc
  autocmd BufNewFile,BufRead *Spec.m setlocal syntax=specta
  autocmd FileType objc setlocal tabstop=4
  autocmd FileType objc setlocal shiftwidth=4
augroup END

let c_no_curly_error = 1
