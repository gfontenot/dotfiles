return {
  'gfontenot/nvim-external-tui',
  dependencies = {
    'folke/snacks.nvim',
  },
  config = function()
    local external_tui = require('external-tui')

    external_tui.add({
      user_cmd = 'Scooter',
      cmd = 'scooter',
      text_flag = '--search-text',
      editor_flag = '--editor-command',
    })
  end,
}
