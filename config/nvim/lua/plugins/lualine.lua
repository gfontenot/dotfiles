return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"jesseleite/nvim-noirbuddy",
	},
	config = function()
		local noirbuddy_lualine = require("noirbuddy.plugins.lualine")

		require("lualine").setup({
			options = {
				theme = noirbuddy_lualine.theme,
			},
			sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "branch" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
