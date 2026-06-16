return {
  {
    "cord.nvim",
    cmd = { "Copilot" },
    event = "VimEnter",
    after = function()
      require("cord").setup()
    end,
  },
}
