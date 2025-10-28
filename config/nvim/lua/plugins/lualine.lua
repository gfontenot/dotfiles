return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-mini/mini.nvim",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
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
