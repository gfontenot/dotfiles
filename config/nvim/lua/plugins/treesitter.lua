return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"swift",
				"haskell",
				"javascript",
				"html",
				"lua",
				"vim",
				"vimdoc",
				"bash",
				"markdown",
				"tmux",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
