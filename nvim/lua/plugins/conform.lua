-- conform.nvim configuration
return {
  "conform.nvim",
  event = "VimEnter",
  keys = {
    { "<leader>FF", desc = "[F]ormat [F]ile" },
  },
  after = function(plugin)
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        nix = { "nixfmt" },
        rust = { "rustfmt" },
        ["*"] = { "injected" },
        ["_"] = { "trim_whitespace", "squeeze_blanks" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      formatters = {
        stylua = {
          command = "stylua",
          args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
        },
        nixfmt = {
          command = "nixfmt",
          args = { "-" },
        },
      },
    })
    conform.formatters.injected = {
      -- Set the options field
      options = {
        -- Set to true to ignore errors
        ignore_errors = false,
        -- Map of treesitter language to file extension
        -- A temporary file name with this extension will be generated during formatting
        -- because some formatters care about the filename.
        lang_to_ext = {
          bash = "sh",
          c_sharp = "cs",
          elixir = "exs",
          javascript = "js",
          julia = "jl",
          latex = "tex",
          markdown = "md",
          python = "py",
          ruby = "rb",
          rust = "rs",
          teal = "tl",
          r = "r",
          typescript = "ts",
          nix = "nix",
          lua = "lua",
        },
        -- Map of treesitter language to formatters to use
        -- (defaults to the value from formatters_by_ft)
        lang_to_formatters = {},
      },
    }

    vim.keymap.set({ "n", "v" }, "<leader>FF", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "[F]ormat [F]ile" })
  end,
}
