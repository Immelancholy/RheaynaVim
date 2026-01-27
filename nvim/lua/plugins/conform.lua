-- conform.nvim configuration
return {
	"conform.nvim",
	auto_enable = true,
	keys = {
		{ "<leader>FF", desc = "[F]ormat [F]ile" },
	},
	after = function(plugin)
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = nixInfo(nil, "settings", "cats", "lua") and { "stylua" } or nil,
				sh = { "shfmt" },
				bash = { "shfmt" },
				nix = { "alejandra" },
				rust = { "rustfmt" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>FF", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "[F]ormat [F]ile" })
	end,
}
