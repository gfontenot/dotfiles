" Mimic ctrl-p because muscle memory
nmap <C-p> :Files<CR>

" Don't take up too much space (40% is the default)
let g:fzf_layout = { 'down': '~20%' }

" Use `ag` as the default command and filter out ignored files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Override `:Ag` to include preview support. The preview window is hidden by
" default, but can be shown by hitting `?` while viewing the results.
"
" Adding a `!` suffix to this command presents a fullscreen version of the
" preview window instead.
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
