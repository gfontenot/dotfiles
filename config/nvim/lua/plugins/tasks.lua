return {
	"EthanJWright/vs-tasks.nvim",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("vstask").setup({
			require("telescope").load_extension("vstask"),
			telescope_keys = {
				vertical = "<C-v>",
				split = "<CR>",
				tab = "<C-t>",
				current = "<C-=>",
				background = "<C-b>",
				watch_job = "<C-w>",
				kill_job = "<C-d>",
				run = "<C-r>",
			},
		})
	end,
	keys = {
		{
			"<Leader>cp",
			function()
				require("vstask").tasks()
			end,
			desc = "Open [C]ommand [P]icker",
		},
	},
}
