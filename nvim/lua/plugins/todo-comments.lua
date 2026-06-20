return {
  "todo-comments.nvim",
  event = "VimEnter",
  after = function()
    require("todo-comments").setup()
    vim.keymap.set("n", "]c", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[c", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })
  end,
}
