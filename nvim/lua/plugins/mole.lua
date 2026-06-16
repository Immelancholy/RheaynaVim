return {
  "mole.nvim",
  event = "VimEnter",
  after = function()
    require("mole").setup({
      -- Your config here
    })
  end,
}
