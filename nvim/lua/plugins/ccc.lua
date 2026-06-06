return {
  "ccc.nvim",
  event = "VimEnter",
  after = function(plugin)
    local ccc = require("ccc")
    ccc.setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    })
    vim.keymap.set("n", "<leader>cp", function()
      vim.cmd("CccPick")
    end, { desc = "Pick Color" })
    vim.keymap.set("n", "<leader>cc", function()
      vim.cmd("CccConvert")
    end, { desc = "Convert Color" })
  end,
}
