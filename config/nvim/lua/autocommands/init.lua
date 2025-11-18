local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-----------------------------------------------------------
-- Basics
-----------------------------------------------------------

local basicsGroup = augroup('general', { clear = true })

-- Automatically resize splits when the parent window size changes
autocmd('VimResized', {
  group = basicsGroup,
  command = 'wincmd =',
})

-----------------------------------------------------------
-- Diagnostics
-----------------------------------------------------------

local diagnosticsGroup = augroup('diagnostics', { clear = true })

local function diagnostics_autocmd(typ, pattern, cmdOrFn)
  if type(cmdOrFn) == 'function' then
    autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = diagnosticsGroup })
  else
    autocmd(typ, { pattern = pattern, command = cmdOrFn, group = diagnosticsGroup })
  end
end

diagnostics_autocmd({ 'CursorHold', 'InsertLeave' }, nil, function()
  local opts = {
    focusable = false,
    scope = 'cursor',
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
  }
  vim.diagnostic.open_float(nil, opts)
end)

diagnostics_autocmd('InsertEnter', nil, function()
  vim.diagnostic.enable(false)
end)

diagnostics_autocmd('InsertLeave', nil, function()
  vim.diagnostic.enable(true)
end)

-----------------------------------------------------------
-- LSP
-----------------------------------------------------------

autocmd('LspAttach', {
  group = augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local methods = vim.lsp.protocol.Methods

    -- Nothing to do if we don't have a client
    if not client then
      return
    end

    -- Highlight the token under the cursor on CursorHold
    if client:supports_method(methods.textDocument_documentHighlight, event.buf) then
      local highlightGroup = augroup('lsp-highlight', { clear = false })
      autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlightGroup,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlightGroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- Clear out autocommands on LspDetach
      autocmd('LspDetach', {
        group = augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({
            group = highlightGroup,
            buffer = event2.buf,
          })
        end,
      })
    end

    -- Inline completion should be available in the next release of Neovim
    -- if client:supports_method(methods.textDocument_inlineCompletion, event.buf) then
    --   vim.lsp.inline_completion.enable(true, { bufnr = event.buf })
    -- end

    -- Install LSP keymaps for the current buffer
    require('keymaps.lsp').install(client, event.buf)
  end,
})
