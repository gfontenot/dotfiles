local Snacks = require("snacks")
local scooter_term = nil

-- Open scooter in a floating terminal
local function open_scooter(term)
	local cmd = "scooter"

	if term then
		cmd = cmd .. " --search-text " .. term
	end

	scooter_term = Snacks.terminal.open(cmd, { win = { style = "float" } })
end

-- Called by scooter to open the selected file at the correct line from the scooter search list
_G.EditLineFromScooter = function(file_path, line)
	if scooter_term and not scooter_term.closed then
		scooter_term:toggle()
	end

	local current_path = vim.fn.expand("%:p")
	local target_path = vim.fn.fnamemodify(file_path, ":p")

	if current_path ~= target_path then
		vim.cmd.edit(vim.fn.fnameescape(file_path))
	end

	vim.api.nvim_win_set_cursor(0, { line, 0 })
end

vim.api.nvim_create_user_command("Scooter", function(opts)
	if opts.range > 0 then
		-- Get the exact visual selection using marks
		local start_pos = vim.api.nvim_buf_get_mark(0, "<")
		local end_pos = vim.api.nvim_buf_get_mark(0, ">")
		local start_row, start_col = start_pos[1] - 1, start_pos[2]
		local end_row, end_col = end_pos[1] - 1, end_pos[2] + 1

		-- Get the selected text with character precision
		local lines = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
		local text = table.concat(lines, "\n")
		open_scooter(text)
	else
		open_scooter()
	end
end, { range = true, desc = "Open scooter" })
