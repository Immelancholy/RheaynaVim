-- indent-blankline.nvim configuration
return {
  "indent-blankline.nvim",
  event = "VimEnter",
  after = function()
    require("ibl").setup()
  end,
}
