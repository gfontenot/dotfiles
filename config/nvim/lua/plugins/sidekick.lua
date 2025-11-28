return {
  {
    'folke/sidekick.nvim',
    opts = {
      -- NES support feels wonky to me, so just use the AI sidebar stuff
      nes = { enabled = false },
      cli = {
        prompts = {
          review_unstaged = 'Give me a comprehensive code review of my unstaged changes',
          review_main = 'Give me a comprehensive code review of all changes in this branch',
          refactor = 'Come up with a plan to refactor {this} to be more idiomatic/readable/maintainable',
        },
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
