---@class NavMapping
---@field lhs string Keybinding
---@field direction 'first'|'last'|'next'|'prev'
---@field desc string Keymap description

return {
	"lewis6991/gitsigns.nvim",
	version = "0.9",
	opts = {
		on_attach = function(bufnr)
			-- Set up keybindings
			local gitsigns = require("gitsigns")

			---@param mappings NavMapping[] List of NavMappings
			---@return nil
			local function mapnav(mappings)
				for _, mapping in ipairs(mappings) do
					vim.keymap.set("n", mapping.lhs, function()
						if vim.wo.diff then
							vim.cmd.normal({ mapping.lhs, bang = true })
						else
							gitsigns.nav_hunk(mapping.direction)
						end
					end, {
						desc = mapping.desc,
						buffer = bufnr,
					})
				end
			end

			-- Navigation
			mapnav({
				{ lhs = "]c", direction = "next", desc = "Next Change" },
				{ lhs = "[c", direction = "prev", desc = "Previous Change" },
			})

			local function nmap(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc, buffer = bufnr })
			end

			nmap("<Leader>hp", gitsigns.preview_hunk, "Preview hunk")
			nmap("<Leader>hi", gitsigns.preview_hunk_inline, "Preview hunk (inline)")
		end,
	},
	init = function()
		-- Always show the sign column
		vim.opt.signcolumn = "yes"
	end,
}
