-- obsidian.nvim configuration
return {
	"obsidian.nvim",
	ft = "markdown",
	after = function(plugin)
		require("obsidian").setup({
			legacy_commands = false,
			workspaces = {
				{
					name = "Notes",
					path = function()
						return assert(os.getenv("NOTES_PATH"))
					end,
				},
			},
		})
	end,
}
