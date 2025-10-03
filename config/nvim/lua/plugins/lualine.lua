return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/trouble.nvim",
	},
	config = function()
		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			-- The following line is needed to fix the background color
			-- Set it to the lualine section you want to use
			hl_group = "lualine_c_normal",
		})

		require("lualine").setup({
			options = {
				theme = "onedark",
			},
			sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = { { symbols.get, cond = symbols.has } },
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
