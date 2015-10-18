Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

let g:VtrGitCdUpOnOpen = 1

nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>ar :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
