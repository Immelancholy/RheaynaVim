-- Atone.nvim configuration
return {
  "atone.nvim",
  event = "VimEnter",
  after = function()
    require("atone").setup()
    vim.keymap.set("n", "<leader>u", function()
      vim.cmd("Atone")
    end, { desc = "Open Undo Tree" })
  end,
}
