return {
  'chrishrb/gx.nvim',
  submodules = false,
  keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
  cmd = { 'Browse' },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  opts = {
    -- If multiple URLs match, use the top one without prompting
    select_prompt = false,
    -- These handlers have higher precedence than builtin handlers
    handlers = {
      -- custom handler to open Linear tickets
      linear = {
        name = 'linear',
        handle = function(mode, line, _)
          -- %u == \u in vim's patterns, i.e. uppercase
          local ticket = require('gx.helper').find(line, mode, '(%u+-%d+)')
          if ticket and #ticket < 20 then
            return 'https://linear.app/squareup/issue/' .. ticket
          end
        end,
      },
    },
  },
}
