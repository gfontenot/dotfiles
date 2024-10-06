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
			sections = noirbuddy_lualine.sections,
			inactive_sections = noirbuddy_lualine.inactive_sections,
		})
	end,
}
