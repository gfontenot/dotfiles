let g:lightline = { 'colorscheme': 'wombat' }

let g:lightline.active = {
      \   'right': [
      \      ['fugitive'],
      \      ['filetype'],
      \   ]
\}

let g:lightline.component_function = {
      \  'fugitive': 'LightLineFugitive'
\}

let g:lightline.inactive = { 'right': [ ] }

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
