-- indent-blankline.nvim configuration
return {
	"indent-blankline.nvim",
	event = "VimEnter",
	after = function(plugin)
		require("ibl").setup()
	end,
}
