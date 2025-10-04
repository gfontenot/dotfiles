return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		renderer = {
			root_folder_label = false,
		},
	},
	keys = {
		{ "<Leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle Tree" },
	},
}
