return {
  "quickbuf.nvim",
  event = "VimEnter",
  after = function()
    require("quickbuf").setup({
      picker = {
        fuzzy_backend = "snacks",
        show_icons = true,
      },
    })
    vim.keymap.set("n", "<Tab>", "<cmd>QuickBuf<CR>", { desc = "QuickBuf" })
    vim.keymap.set("n", "<leader><leader>t", "<cmd>QuickBufPinToggle<CR>", { desc = "Pin toggle" })
    vim.keymap.set("n", "<S-h>", "<cmd>QuickBufPrevPinned<CR>", { desc = "Prev pinned buffer" })
    vim.keymap.set("n", "<S-l>", "<cmd>QuickBufNextPinned<CR>", { desc = "Next pinned buffer" })
  end,
}
