return {
  "arborist",
  lazy = false,
  auto_enable = true,
  after = function()
    require("arborist").setup({
      update_cadence = "weekly",
      ensure_installed = {
        "nix",
        "lua",
        "rust",
      },
    })
  end,
}
