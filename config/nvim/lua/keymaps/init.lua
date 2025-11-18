local Util = require('util')

-- [[ MAPPINGS ]]

local wk = require('which-key')

-- Delete hjkl mappings since they don't make sense at all on my keyboard layout (Workman)
-- I actually use the arrow keys for these operations (or I use better navigation modes)
wk.add({
  { 'h', '<Nop>', desc = 'Disabled' },
  { 'j', '<Nop>', desc = 'Disabled' },
  { 'k', '<Nop>', desc = 'Disabled' },
  { 'l', '<Nop>', desc = 'Disabled' },
})

-- Split Management
wk.add({
  { '<C-\\>', '<C-w>s', desc = 'Create a new horizontal split' },
  { '<C-->', '<C-w>v', desc = 'Create a new vertical split' },
  {
    '<A-Up>',
    '<C-w><Up>',
    desc = 'Move cursor to the split above the current one',
  },
  {
    '<A-Down>',
    '<C-w><Down>',
    desc = 'Move cursor to the split below the current one',
  },
  {
    '<A-b>', -- <A-Left>
    '<C-w><Left>',
    desc = 'Move cursor to the split to the left',
  },
  {
    '<A-f>', -- <A-Right>
    '<C-w><Right>',
    desc = 'Move cursor to the split to the right',
  },
})

-- Misc
wk.add({
  { '<Leader><Leader>', '<C-^>', desc = 'Jump back to the previous file' },

  {
    '<Esc>',
    function()
      Util.close_floats()
      if vim.bo.modifiable then
        Util.clear_highlights()
      else
        if #vim.api.nvim_list_wins() > 1 then
          return Util.feedkeys('<C-w>c')
        end
      end
    end,
    desc = 'Close floats, clear highlights',
  },
})
