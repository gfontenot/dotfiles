return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'igorlfs/nvim-dap-view',
      'theHamsta/nvim-dap-virtual-text',

      -- C++, C, Rust
      'julianolf/nvim-dap-lldb',
    },
    keys = {
      { '<Leader>dt', '<Cmd>DapViewToggle<Cr>', desc = '[D]ebugger: [T]oggle view' },
      { '<Leader>db', '<Cmd>DapToggleBreakpoint<Cr>', desc = '[D]ebugger: Toggle [B]reakpoint' },
      { '<Leader>dc', '<Cmd>DapContinue<Cr>', desc = '[D]ebugger: [C]ontinue' },
      { '<Leader>dw', '<Cmd>DapViewWatch<Cr>', desc = '[D]ebugger: [W]atch variable' },
      { '<Leader>dq', '<Cmd>DapTerminate<Cr>', desc = '[D]ebugger: [Q]uit (terminate)' },
    },
    config = function()
      require('dap-view').setup({
        auto_toggle = true,
        winbar = {
          controls = {
            enabled = true,
          },
        },
      })
      require('nvim-dap-virtual-text').setup({})
      require('dap-lldb').setup()

      local icons = require('config.icons')

      vim.fn.sign_define('DapBreakpoint', {
        text = icons.debugger.breakpoint,
        texthl = '',
        linehl = '',
        numhl = '',
      })
    end,
  },
}
