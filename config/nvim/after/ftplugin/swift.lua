local MiniSplitjoin = require('mini.splitjoin')

vim.opt_local.colorcolumn = '120'

local gen_hook = MiniSplitjoin.gen_hook

local parens_brackets = { brackets = { '%b()', '%b[]' } }
local curly = { brackets = { '%b{}' } }

-- Add trailing comma when splitting inside brackets
local add_trailing_commas = gen_hook.add_trailing_separator(parens_brackets)
-- Delete trailing comma when joining inside brackets
local remove_trailing_commas = gen_hook.del_trailing_separator(parens_brackets)
-- Pad curly brackets with single space after join
local pad_curly = gen_hook.pad_brackets(curly)

-- Create buffer-local config
vim.b.minisplitjoin_config = {
  split = { hooks_post = { add_trailing_commas } },
  join = { hooks_post = { remove_trailing_commas, pad_curly } },
}
