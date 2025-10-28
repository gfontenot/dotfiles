return {
	"folke/snacks.nvim",
	dependencies = {
		"folke/which-key.nvim",
	},
	priority = 1000,
	lazy = false,
	config = function()
		local Snacks = require("snacks")
		Snacks.setup({
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						cwd = true,
						indent = 2,
						padding = 1,
					},
					{ section = "startup" },
				},
			},
			explorer = {},
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			picker = {},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		})

		local wk = require("which-key")

		wk.add({
			{
				"<Leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Launch lazygit",
			},
		})

		-- Picker
		wk.add({
			{
				"<C-p>",
				function()
					Snacks.picker.files({ hidden = true })
				end,
				desc = "Find Files",
			},
			{ "<Leader>fb", Snacks.picker.buffers, desc = "Find open buffers" },
			{ "<Leader>fg", Snacks.picker.git_status, desc = "Find dirty files" },
			{ "<Leader>ff", Snacks.picker.grep, desc = "Live grep" },
			{ "<C-k>", Snacks.picker.grep_word, desc = "Search for the word under the cursor" },
			{
				"<C-e>",
				function()
					Snacks.explorer()
				end,
				desc = "Open file explorer",
			},
		})
	end,
}
