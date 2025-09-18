return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-vim-test",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-plenary"),
				require("neotest-vim-test")({ ignore_filetypes = { "swift", "lua" } }),
			},
			output = {
				enabled = true,
				open_on_run = false,
			},
		})
	end,
	keys = {
		{
			"<Leader>tt",
			function()
				require("neotest").run.run()
			end,
			{ desc = "Run nearest test" },
		},
		{
			"<Leader>tT",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			{ desc = "Run all tests in file" },
		},
		{
			"<Leader>ta",
			function()
				require("neotest").run.run({ suite = true, extra_args = { target = true } })
			end,
			{ desc = "Run all tests in current target." },
		},
		{
			"<Leader>tA",
			function()
				require("neotest").run.run({ suite = true })
			end,
			{ desc = "Run all tests in project" },
		},
		{
			"<Leader>tr",
			function()
				require("neotest").run.run_last()
			end,
			{ desc = "Re-run the previous tests" },
		},
		{
			"<Leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			{ silent = true, desc = "Test summary" },
		},
		{
			"<Leader>to",
			function()
				require("neotest").output.open({ short = true, enter = true })
			end,
			{ silent = true, desc = "Open test output" },
		},
		{
			"<Leader>tp",
			function()
				require("neotest").output_panel.toggle()
			end,
			{ silent = true, desc = "Toggle test output pane" },
		},
	},
}
