-- better-escape.nvim configuration
return {
	"better-escape.nvim",
	event = "VimEnter",
	after = function(plugin)
		require("better_escape").setup()
	end,
}
