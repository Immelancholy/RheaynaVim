-- mini.icons configuration
return {
  "mini.icons",
  event = "VimEnter",
  after = function()
    require("mini.icons").setup()
  end,
}
