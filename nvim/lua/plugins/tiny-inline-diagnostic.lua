-- tiny-inline-diagnostic.nvim configuration
return {
	"tiny-inline-diagnostic.nvim",
	auto_enable = true,
	event = "VimEnter",
	after = function(plugin)
		require("tiny-inline-diagnostic").setup({
			options = {
				add_messages = {
					display_count = true,
				},
				multilines = {
					enabled = true,
					always_show = true,
				},
				show_source = {
					enabled = true,
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
