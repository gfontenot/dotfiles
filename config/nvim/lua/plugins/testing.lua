return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>tt", "<cmd>TestNearest<cr>" },
		{ "<leader>tT", "<cmd>TestFile<cr>" },
		{ "<leader>ta", "<cmd>TestSuite<cr>" },
		{ "<leader>tl", "<cmd>TestLast<cr>" },
		{ "<leader>tg", "<cmd>TestVisit<cr>" },
	},
	config = function()
		vim.cmd('let test#strategy = "vtr"')
	end,
}
