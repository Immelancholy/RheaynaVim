return {
	"oil.nvim",
	auto_enable = true,
	lazy = false,
	after = function()
		require("oil").setup()
		vim.keymap.set("n", "_", function()
			vim.cmd("Oil")
		end, { desc = "Open Oil" })
	end,
}
