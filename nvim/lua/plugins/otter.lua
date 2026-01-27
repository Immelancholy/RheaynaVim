-- otter.nvim configuration (embedded language support)
return {
	"otter.nvim",
	event = "VimEnter",
	after = function(plugin)
		local otter = require("otter")
		otter.setup()

		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = { "*.*" },
			callback = function()
				otter.activate()
			end,
			group = "WorkingDirectory",
		})
	end,
}
