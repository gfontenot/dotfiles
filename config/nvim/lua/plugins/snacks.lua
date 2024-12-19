return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
