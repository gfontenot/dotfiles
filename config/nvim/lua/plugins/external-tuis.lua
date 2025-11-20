return {
  'gfontenot/nvim-external-tui',
  dependencies = {
    'folke/snacks.nvim',
  },
  config = function()
    local external_tui = require('external-tui')

    local config = external_tui.add({
      user_cmd = 'Scooter',
      cmd = 'scooter',
      text_arg = '--search-text',
    })
  end,
}
