return {
  "lazygit.nvim",
  event = "VimEnter",
  after = function(plugin)
    vim.keymap.set({ "n", "v", "x" }, "<leader>gg", "<cmd>LazyGit<CR>")
  end,
}
