return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.8",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				prompt_prefix = " ❯ ",
				selection_caret = "❯ ",
			},
		})

		-- Telescope Remaps
		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<C-b>", builtin.buffers, { desc = "Find open buffers" })
		vim.keymap.set("n", "<C-g>", builtin.git_status, { desc = "Find dirty files" })
		vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<C-k>", builtin.grep_string, { desc = "Search for word under the cursor" })
		vim.keymap.set(
			"n",
			"<C-e>",
			":Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<CR>",
			{ desc = "Open file browser" }
		)
	end,
}
