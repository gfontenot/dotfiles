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
		})
	end,
}
