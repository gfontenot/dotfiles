" Mimic ctrl-p because muscle memory
nmap <C-p> :Files<CR>

" Don't take up too much space (40% is the default)
let g:fzf_layout = { 'down': '~20%' }

" Use `ag` as the default command and filter out ignored files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
