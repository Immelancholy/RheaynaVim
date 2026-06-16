-- fidget.nvim configuration
return {
  "fidget.nvim",
  auto_enable = true,
  event = "DeferredUIEnter",
  after = function()
    require("fidget").setup({})
  end,
}
