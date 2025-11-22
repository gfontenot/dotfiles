-- Disable netrw
-- This needs to happen as early as possible in the startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use <Space> as our leader. We need to set this before we load plugins so
-- that they can use the right leader if they set up their own keybindings with
-- it.
vim.g.mapleader = ' '

-- Load plugins
require('config.lazy')

-- Configure diagnostic symbols
local icons = require('config.icons')
local diagnostic_symbols = {
  DiagnosticSignError = icons.diagnostics.error,
  DiagnosticSignWarn = icons.diagnostics.warn,
  DiagnosticSignHint = icons.diagnostics.hint,
  DiagnosticSignInfo = icons.diagnostics.info,
}

for name, icon in pairs(diagnostic_symbols) do
  vim.fn.sign_define(name, { text = icon, texthl = name })
end
