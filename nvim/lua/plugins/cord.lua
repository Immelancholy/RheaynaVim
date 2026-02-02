return {
	{
		"cord.nvim",
		cmd = { "Copilot" },
		event = "VimEnter",
		after = function(plugin)
			require("cord").setup()
		end,
	},
}
