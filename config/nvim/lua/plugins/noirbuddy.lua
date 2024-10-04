return {
	'jesseleite/nvim-noirbuddy',
	dependencies = {
		{ 'tjdevries/colorbuddy.nvim' }
	},
	lazy = false,
	priority = 1000,
	opts = {
			preset = "slate",
			styles = {
				italic = true,
				bold = true,
				underline = true,
				undercurl = true,
			},
	}
}
