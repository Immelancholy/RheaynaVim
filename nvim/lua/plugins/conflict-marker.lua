return {
	"conflict-marker.nvim",
	auto_enable = true,
	lazy = false,
	after = function(plugin)
		require("conflict-marker").setup({
			highlights = true,
			markers = {
				start = "^<<<<<<<",
				ending = "^>>>>>>>",
				mid = "^=======$",
				base = "^|||||||",
			},

			on_attach = function(conflict)
				local MID = "^=======$"

				vim.keymap.set("n", "[x", function()
					vim.cmd("?" .. MID)
				end, { buffer = conflict.bufnr })

				vim.keymap.set("n", "]x", function()
					vim.cmd("/" .. MID)
				end, { buffer = conflict.bufnr })

				local map = function(key, fn)
					vim.keymap.set("n", key, fn, { buffer = conflict.bufnr })
				end

				-- or you can map these to <cmd>Choose ours<cr>

				map("<leader>co", function()
					conflict:choose_ours()
				end)
				map("<leader>ct", function()
					conflict:choose_theirs()
				end)
				map("<leader>cb", function()
					conflict:choose_both()
				end)
				map("<leader>cn", function()
					conflict:choose_none()
				end)
			end,
		})
	end,
}
