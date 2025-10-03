return {
	"nvim-mini/mini.nvim",

	config = function()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()
	end,
}
