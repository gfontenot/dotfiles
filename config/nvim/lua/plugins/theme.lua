return {
  'webhooked/kanso.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanso').setup({
      overrides = function(colors)
        return {
          -- Bring back window borders
          WinSeparator = {
            fg = colors.palette.mistBg3,
            bg = colors.theme.ui.none,
          },
        }
      end,
    })
    vim.cmd([[colorscheme kanso-mist]])
  end,
}
