local Terminal = require("toggleterm.terminal").Terminal
local scooter_term = nil

-- Open existing scooter terminal if one is available, otherwise create a new one
local function open_scooter()
	if not scooter_term then
		scooter_term = Terminal:new({
			cmd = "scooter",
			direction = "float",
			close_on_exit = true,
			on_exit = function()
				scooter_term = nil
			end,
		})
	end
	scooter_term:open()
end

-- Called by scooter to open the selected file at the correct line from the scooter search list
_G.EditLineFromScooter = function(file_path, line)
	if scooter_term and scooter_term:is_open() then
		scooter_term:close()
	end

	local current_path = vim.fn.expand("%:p")
	local target_path = vim.fn.fnamemodify(file_path, ":p")

	if current_path ~= target_path then
		vim.cmd.edit(vim.fn.fnameescape(file_path))
	end

	vim.api.nvim_win_set_cursor(0, { line, 0 })
end

-- Opens scooter with the search text populated by the `search_text` arg
_G.OpenScooterSearchText = function(search_text)
	if scooter_term and scooter_term:is_open() then
		scooter_term:close()
	end

	local escaped_text = vim.fn.shellescape(search_text:gsub("\r?\n", " "))
	scooter_term = Terminal:new({
		cmd = "scooter --search-text " .. escaped_text,
		direction = "float",
		close_on_exit = true,
		on_exit = function()
			scooter_term = nil
		end,
	})
	scooter_term:open()
end

vim.keymap.set("n", "<C-s>", open_scooter, { desc = "Open scooter" })

vim.keymap.set(
	"v",
	"<C-s>",
	'"ay<ESC><cmd>lua OpenScooterSearchText(vim.fn.getreg("a"))<CR>',
	{ desc = "Search selected text in scooter" }
)
