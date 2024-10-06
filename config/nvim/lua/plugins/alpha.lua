return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local theme = require("alpha.themes.theta")
		theme.file_icons.provider = "devicons"

		-- Customize quick links
		theme.buttons.val = {
			{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
			{ type = "padding", val = 1 },
			dashboard.button("e", "  New file", "<cmd>ene<CR>"),
			dashboard.button("CTRL+p", "󰈞  Find file"),
			dashboard.button("CTRL+f", "󰊄  Live grep"),
			dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}

		require("alpha").setup(theme.config)
	end,
}
