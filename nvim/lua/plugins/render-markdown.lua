return {
  "render-markdown.nvim",
  after = function()
    require("render-markdown").setup({
      file_types = { "markdown", "vimwiki" },
    })
  end,
}
