return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {
          'bash',
          'haskell',
          'html',
          'javascript',
          'latex',
          'lua',
          'markdown',
          'markdown_inline',
          'swift',
          'typst',
          'vim',
          'vimdoc',
          'yaml',
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
