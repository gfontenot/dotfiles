local Util = require('util')

-- Disable netrw (strongly suggested for nvim-tree)
-- This needs to happen as early as possible in the startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use <Space> as our leader. We need to set this before we load plugins so
-- that they can use the right leader if they set up their own keybindings with
-- it.
vim.g.mapleader = ' '

-- Load plugins
require('config.lazy')
require('scooter')

-- Appearance
vim.opt.colorcolumn = '80'
vim.opt.relativenumber = true
vim.opt.foldlevelstart = 99
vim.opt.conceallevel = 1
vim.opt.scrolloff = 8

vim.opt.winborder = 'rounded'

-- [[ MAPPINGS ]]

-- Delete hjkl mappings since they don't make sense at all on my keyboard layout (Workman)
-- I actually use the arrow keys for these operations (or I use better navigation modes)
vim.keymap.set('n', 'h', '<Nop>')
vim.keymap.set('n', 'j', '<Nop>')
vim.keymap.set('n', 'k', '<Nop>')
vim.keymap.set('n', 'l', '<Nop>')

-- Split Management

vim.keymap.set('n', '<C-\\>', '<C-w>s', { desc = 'Create a new horizontal split' })
vim.keymap.set('n', '<C-->', '<C-w>v', { desc = 'Create a new vertical split' })

-- <A-Right>
vim.keymap.set('n', '<A-f>', '<C-w><Right>', { desc = 'Move cursor to the split to the right' })
-- <A-Left>
vim.keymap.set('n', '<A-b>', '<C-w><Left>', { desc = 'Move cursor to the split to the left' })
vim.keymap.set(
  'n',
  '<A-Down>',
  '<C-w><Down>',
  { desc = 'Move cursor to the split below the current one' }
)
vim.keymap.set(
  'n',
  '<A-Up>',
  '<C-w><Up>',
  { desc = 'Move cursor to the split above the current one' }
)

-- Map <leader><leader> to switch to previous file
vim.keymap.set('n', '<Leader><Leader>', '<C-^>', { desc = 'Jump back to the previous file' })

vim.keymap.set('n', '<Esc>', function()
  Util.close_floats()
  if vim.bo.modifiable then
    Util.clear_highlights()
  else
    if #vim.api.nvim_list_wins() > 1 then
      return Util.feedkeys('<C-w>c')
    end
  end
end, { desc = 'Close floats, clear highlights' })

vim.opt.gdefault = true

-- Live substitutions
vim.opt.inccommand = 'split'

-- Display some whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- [[ Autocommands ]]

-- Automatically resize splits when the parent window size changes
vim.cmd('autocmd VimResized * wincmd =')
