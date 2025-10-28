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
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			picker = { enabled = true },
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
			{
				"<Leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find open buffers",
			},
			{
				"<Leader>fg",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Find dirty files",
			},
			{
				"<Leader>ff",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live grep",
			},
			{
				"<C-k>",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Search for the word under the cursor",
			},
			{
				"<C-e>",
				function()
					Snacks.explorer()
				end,
				desc = "Open file explorer",
			},
			{
				"<Leader>pp",
				function()
					Snacks.picker()
				end,
				desc = "Choose picker",
			},
		})
	end,
}
