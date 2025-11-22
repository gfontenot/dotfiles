local custom_icons = require('config.icons')

return {
  'b0o/incline.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  opts = {
    window = {
      padding = 2,
      margin = {
        vertical = { top = 0, bottom = 0 },
        horizontal = { left = 0, right = 2 },
      },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      local modified = vim.bo[props.buf].modified

      local function buffer_diagnostics()
        local icons = {
          error = custom_icons.diagnostics.error,
          warn = custom_icons.diagnostics.warn,
        }
        local label = {}

        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(
            props.buf,
            { severity = vim.diagnostic.severity[string.upper(severity)] }
          )
          if n > 0 then
            table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
          end
        end
        if #label > 0 then
          table.insert(label, { '┊ ' })
        end
        return label
      end

      local function file_icon()
        local ft_icon, ft_highlight = require('mini.icons').get('file', filename)
        return ft_icon and { ft_icon .. ' ', guifg = ft_highlight, guibg = 'none' } or ''
      end

      local function filename_and_modification()
        return {
          { filename .. ' ', gui = 'bold' },
          modified and { '[+] ', gui = 'bold' } or '',
        }
      end

      return {
        { buffer_diagnostics() },
        { file_icon() },
        { filename_and_modification() },
      }
    end,
  },
}
