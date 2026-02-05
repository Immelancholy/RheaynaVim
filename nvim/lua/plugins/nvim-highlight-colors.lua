return {
	"nvim-highlight-colors",
	event = "VimEnter",
	after = function(plugin)
		require("nvim-highlight-colors").setup()
	end,
}
