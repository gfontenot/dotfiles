local M = {}

M.left_spacer = '▊'
M.right_spacer = '▊'

M.status = ''

-- Base diagnostic icons (without trailing spaces)
M.diagnostics = {
  error = '',
  warn = '',
  hint = '󰌶',
  info = '',
}

-- Diagnostic icons with trailing spaces (for lualine formatting)
M.diagnostics_spaced = vim.tbl_map(function(icon)
  return icon .. ' '
end, M.diagnostics)

return M
