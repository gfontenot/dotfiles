-- Disable netrw (strongly suggested for nvim-tree)
-- This needs to happen as early as possible in the startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use <Space> as our leader. We need to set this before we load plugins so
-- that they can use the right leader if they set up their own keybindings with
-- it.
vim.g.mapleader = ' '

-- Load plugins
require("config.lazy")

-- Appearance
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Open splits to the bottom right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Automatically resize splits when the parent window size changes
vim.cmd("autocmd VimResized * wincmd =")

-- Tabs vs Spaces fight
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = true

-- [[ MAPPINGS ]]

-- Map <leader><leader> to switch to previous file
vim.keymap.set('n', '<Leader><Leader>', '<C-^>', { desc = "Jump back to the previous file" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
