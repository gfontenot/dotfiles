-- Keymaps local to a buffer with an LSP attached.
-- Automatically set via user.autocommands on LspAttach

local Snacks = require('snacks')

local M = {}

function M.install(client, buf)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
  end

  map('gd', Snacks.picker.lsp_definitions, '[G]oto [D]efinition')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('gr', Snacks.picker.lsp_references, '[G]oto [R]eferences')
  map('gI', Snacks.picker.lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', Snacks.picker.lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ds', Snacks.picker.lsp_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', Snacks.picker.lsp_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

  -- Keybindings for client-specific abilities
  if not client then
    return
  end

  local methods = vim.lsp.protocol.Methods

  -- Toggle inline hints if available for the current LSP
  if client:supports_method(methods.textDocument_inlayHint, buf) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
    end, '[T]oggle Inlay [H]ints')
  end

  -- Inline completion should be available in the next release of Neovim
  -- if client:supports_method(methods.textDocument_inlineCompletion, buf) then
  --   vim.lsp.inline_completion.enable(true, { bufnr = buf })
  --
  --   map('i', '<C-F>', vim.lsp.inline_completion.get, 'accept inline completion')
  --   map('i', '<C-G>', vim.lsp.inline_completion.select, 'switch inline completion')
  -- end
end

return M
