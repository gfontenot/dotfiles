let g:markdown_fenced_languages = ['swift', 'ruby', 'sh', 'yaml', 'objc', 'haskell']

let g:limelight_conceal_ctermfg = 'gray'

function! s:goyo_enter()
  if exists('$TMUX')
    " Turn off tmux statusline
    silent !tmux set status off

    " Zoom current pane to fullscreen
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif

  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    " Turn on tmux statusline
    silent !tmux set status on

    " Unzoom current pane if currently zoomed
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif

  set scrolloff=0
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
