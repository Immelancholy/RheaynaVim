return {
	"oil.nvim",
	auto_enable = true,
	lazy = false,
	after = function()
		require("oil").setup({
			keymaps = {
				["<leader>e"] = { "actions.select", mode = "n" },
				["<leader>w"] = { "actions.open_cwd", mode = "n" },
				["<leader>q"] = { "actions.parent", mode = "n" },
			},
		})
		vim.keymap.set("n", "<leader>e", function()
			vim.cmd("Oil")
		end, { desc = "Open Oil" })
	end,
}
