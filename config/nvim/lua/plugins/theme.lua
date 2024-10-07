return {
	"jesseleite/nvim-noirbuddy",
	dependencies = {
		{ "tjdevries/colorbuddy.nvim" },
	},
	lazy = false,
	priority = 1000,
	opts = {
		preset = "minimal",
		styles = {
			italic = true,
			bold = true,
			underline = true,
			undercurl = true,
		},
		colors = {
			background = "#19191F",
			primary = "#78a2c1",
		},
	},
}
