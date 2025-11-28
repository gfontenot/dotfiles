return {
  {
    'folke/sidekick.nvim',
    opts = {
      -- NES support feels wonky to me, so just use the AI sidebar stuff
      nes = { enabled = false },
      cli = {
        win = {
          layout = 'float',
        },
      },
    },
    keys = {
      {
        '<leader>as',
        function()
          require('sidekick.cli').select({ filter = { installed = true } })
        end,
        desc = 'Select CLI',
      },
      {
        '<leader>at',
        function()
          require('sidekick.cli').send({ msg = '{this}' })
        end,
        mode = { 'x', 'n' },
        desc = 'Send This',
      },
      {
        '<leader>av',
        function()
          require('sidekick.cli').send({ msg = '{selection}' })
        end,
        mode = { 'x' },
        desc = 'Send Visual Selection',
      },
      {
        '<leader>ap',
        function()
          require('sidekick.cli').prompt()
        end,
        mode = { 'n', 'x' },
        desc = 'Sidekick Select Prompt',
      },
      {
        '<c-.>',
        function()
          require('sidekick.cli').focus()
        end,
        mode = { 'n', 'x', 'i', 't' },
        desc = 'Sidekick Switch Focus',
      },
    },
  },
}
