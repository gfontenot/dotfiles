vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Open splits to the bottom right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Automatically resize splits when the parent window size changes
vim.cmd("autocmd VimResized * wincmd =")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = true
