return {
  'b0o/incline.nvim',
  event = 'VeryLazy',
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
      local ft_icon, ft_color = require('mini.icons').get('file', filename)
      local modified = vim.bo[props.buf].modified and 'bold,italic' or 'bold'

      local function get_diagnostic_label()
        local icons = { error = '', warn = '' }
        local label = {}

        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(
            props.buf,
            { severity = vim.diagnostic.severity[string.upper(severity)] }
          )
          if n > 0 then
            table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
          end
        end
        if #label > 0 then
          table.insert(label, { '┊ ' })
        end
        return label
      end

      local buffer = {
        { get_diagnostic_label() },
        { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
        { filename .. ' ', gui = modified },
      }
      return buffer
    end,
  },
}
