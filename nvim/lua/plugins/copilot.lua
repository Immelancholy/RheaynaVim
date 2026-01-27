-- Copilot configuration
return {
	{
		"copilot",
		auto_enable = true,
		cmd = { "Copilot" },
		event = "InsertEnter",
		after = function(plugin)
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"blink-cmp-copilot",
		auto_enable = true,
		on_plugin = { "blink.cmp", "copilot" },
	},
}
