return {
  "jj.nvim",
  event = "VimEnter",
  after = function()
    require("jj").setup({})
  end,
}
