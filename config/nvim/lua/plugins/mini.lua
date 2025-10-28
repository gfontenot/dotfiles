return {
	"nvim-mini/mini.nvim",

	config = function()
		require("mini.ai").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()

		local icons = require("mini.icons")
		icons.setup()

		-- Mock nvim-web-devicons for plugins that don't directly support mini.icons
		-- Currently: Lualine, nvim-tree
		icons.mock_nvim_web_devicons()
	end,
}
