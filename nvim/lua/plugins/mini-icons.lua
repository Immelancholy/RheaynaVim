-- mini.icons configuration
return {
	"mini.icons",
	event = "VimEnter",
	after = function(plugin)
		require("mini.icons").setup()
	end,
}
