-- Disable netrw (strongly suggested for nvim-tree)
-- This needs to happen as early as possible in the startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use <Space> as our leader. We need to set this before we load plugins so
-- that they can use the right leader if they set up their own keybindings with
-- it.
vim.g.mapleader = " "

-- Load plugins
require("config.lazy")

-- Appearance
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.foldlevelstart = 99

-- Open splits to the bottom right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Wrap text at line lengths
vim.opt.wrap = true

-- Persist undo history
vim.opt.undofile = true

-- [[ MAPPINGS ]]

-- Map <leader><leader> to switch to previous file
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Jump back to the previous file" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Case insensitive searching unless we include capital letters in the search (or if we specify \C)
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.gdefault = true

-- Live substitutions
vim.opt.inccommand = "split"

-- Display some whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- [[ Autocommands ]]

-- Automatically resize splits when the parent window size changes
vim.cmd("autocmd VimResized * wincmd =")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
