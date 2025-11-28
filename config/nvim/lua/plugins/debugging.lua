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
      {
        '<Leader>dt',
        function()
          require('dap-view').toggle()
        end,
        desc = '[D]ebugger: [T]oggle view',
      },
      {
        '<Leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = '[D]ebugger: Toggle [B]reakpoint',
      },
      {
        '<Leader>dc',
        function()
          require('dap').continue()
        end,
        desc = '[D]ebugger: [C]ontinue',
      },
      {
        '<Leader>dw',
        function()
          require('dap-view').add_expr()
        end,
        desc = '[D]ebugger: [W]atch variable',
      },
      {
        '<Leader>dq',
        function()
          require('dap').terminate()
        end,
        desc = '[D]ebugger: [Q]uit (terminate)',
      },
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
