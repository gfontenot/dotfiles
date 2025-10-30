return {
  'EthanJWright/vs-tasks.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'folke/snacks.nvim',
  },
  config = function()
    require('vstask').setup({
      picker = 'snacks',
      telescope_keys = { -- These bindings still work with Snacks.picker
        vertical = '<C-v>',
        split = '<CR>',
        tab = '<C-t>',
        current = '<C-=>',
        background = '<C-b>',
        watch_job = '<C-w>',
        kill_job = '<C-d>',
        run = '<C-r>',
      },
    })
  end,
  keys = {
    {
      '<Leader>cp',
      function()
        require('vstask').tasks()
      end,
      desc = 'Open [C]ommand [P]icker',
    },
  },
}
