return {
  "lazyjj.nvim",
  event = "VimEnter",
  after = function(plugin)
    require("lazyjj").setup()
  end,
}
