return {
	"oil.nvim",
	auto_enable = true,
	lazy = false,
	after = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>e", function()
			vim.cmd("Oil")
		end, { desc = "Open Oil" })
	end,
}
