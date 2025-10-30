local Util = {}

function Util.close_floats()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == 'win' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

--- Gets the buffer number of every visible buffer
--- @return integer[]
function Util.visible_buffers()
  return vim.tbl_map(vim.api.nvim_win_get_buf, vim.api.nvim_list_wins())
end

function Util.lsp_active()
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.server_capabilities then
      return true
    end
  end
  return false
end

function Util.clear_highlights()
  vim.cmd('nohlsearch')
  if Util.lsp_active() then
    vim.lsp.buf.clear_references()
    for _, buffer in pairs(Util.visible_buffers()) do
      vim.lsp.util.buf_clear_references(buffer)
    end
  end
end

---@param str string
function Util.termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

---@param keys string
---@param mode? string
function Util.feedkeys(keys, mode)
  if mode == nil then
    mode = 'in'
  end
  return vim.api.nvim_feedkeys(Util.termcodes(keys), mode, true)
end

local function expand_home(filepath)
  if filepath:sub(1, 1) == '~' then
    -- Get home directory from environment variable
    local home = os.getenv('HOME') or os.getenv('USERPROFILE') -- USERPROFILE for Windows
    if home then
      return home .. filepath:sub(2)
    end
  end
  return filepath
end

function Util.load_file_with_fallback(filepath, fallback)
  -- Expand the path first
  filepath = expand_home(filepath)

  local file, err = io.open(filepath, 'r')
  if not file then
    return type(fallback) == 'function' and fallback() or fallback or ''
  end

  local content = file:read('*all')
  file:close()

  if not content then
    return type(fallback) == 'function' and fallback() or fallback or ''
  end

  return content
end

return Util
