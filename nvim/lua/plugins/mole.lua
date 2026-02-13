return {
	"mole.nvim",
	event = "VimEnter",
	after = function(plugin)
		require("mole").setup({
			-- Your config here
		})
	end,
}
