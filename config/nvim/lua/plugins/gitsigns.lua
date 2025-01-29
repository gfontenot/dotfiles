return {
	"lewis6991/gitsigns.nvim",
	version = "0.9",
	opts = {
		on_attach = function(bufnr)
			-- Set up keybindings
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)
		end,
	},
	init = function()
		-- Always show the sign column
		vim.opt.signcolumn = "yes"
	end,
}
