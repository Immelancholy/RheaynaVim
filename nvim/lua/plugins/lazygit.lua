return {
  "lazygit.nvim",
  event = "VimEnter",
  after = function(plugin)
    require("lazygit").setup()
  end,
}
