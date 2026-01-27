-- nvim-lint configuration
return {
	"nvim-lint",
	auto_enable = true,
	event = "FileType",
	after = function(plugin)
		require("lint").linters_by_ft = {
			bash = { "shellcheck" },
			nix = { "nix" },
			rust = { "clippy" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
