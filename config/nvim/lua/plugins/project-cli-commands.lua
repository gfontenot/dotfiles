return {
	"dimaportenko/project-cli-commands.nvim",

	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-telescope/telescope.nvim",
	},

	-- optional keymap config
	config = function()
		local OpenActions = require("project_cli_commands.open_actions")
		local RunActions = require("project_cli_commands.actions")

		local config = {
			-- Key mappings bound inside the telescope window
			running_telescope_mapping = {
				["<C-c>"] = RunActions.exit_terminal,
				["<C-f>"] = RunActions.open_float,
				["<C-v>"] = RunActions.open_vertical,
				["<C-h>"] = RunActions.open_horizontal,
			},
			open_telescope_mapping = {
				{ mode = "i", key = "<CR>", action = OpenActions.execute_script_vertical },
				{ mode = "n", key = "<CR>", action = OpenActions.execute_script_vertical },
				{ mode = "i", key = "<C-h>", action = OpenActions.execute_script },
				{ mode = "n", key = "<C-h>", action = OpenActions.execute_script },
				{ mode = "i", key = "<C-i>", action = OpenActions.execute_script_with_input },
				{ mode = "n", key = "<C-i>", action = OpenActions.execute_script_with_input },
				{ mode = "i", key = "<C-c>", action = OpenActions.copy_command_clipboard },
				{ mode = "n", key = "<C-c>", action = OpenActions.copy_command_clipboard },
				{ mode = "i", key = "<C-f>", action = OpenActions.execute_script_float },
				{ mode = "n", key = "<C-f>", action = OpenActions.execute_script_float },
				{ mode = "i", key = "<C-v>", action = OpenActions.execute_script_vertical },
				{ mode = "n", key = "<C-v>", action = OpenActions.execute_script_vertical },
			},
		}

		require("project_cli_commands").setup(config)
	end,

	keys = {
		{
			"<Leader>co",
			"<Cmd>Telescope project_cli_commands open<CR>",
			{ desc = "Open the project CLI commands", noremap = true, silent = true },
		},
	},
}
