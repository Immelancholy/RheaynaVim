-- Plugins initialization file
-- This file imports all plugin configurations using lze's import spec

return {
  -- UI and appearance
  { import = "plugins.mini-base16" },
  { import = "plugins.noice" },
  { import = "plugins.snacks" },
  { import = "plugins.lualine" },
  { import = "plugins.mini-icons" },
  { import = "plugins.tiny-inline-diagnostic" },
  { import = "plugins.fidget" },
  { import = "plugins.which-key" },
  { import = "plugins.indent-blankline" },
  { import = "plugins.render-markdown" },
  { import = "plugins.image" },
  { import = "plugins.todo-comments" },

  -- LSP and language support
  { import = "plugins.lsp" },
  { import = "plugins.arborist" },
  { import = "plugins.conform" },
  { import = "plugins.lint" },
  { import = "plugins.ccc" },
  { import = "plugins.trouble" },

  -- Completion
  { import = "plugins.completion" },

  -- Navigation
  { import = "plugins.harpoon" },
  { import = "plugins.flash" },
  { import = "plugins.quickbuf" },

  -- File Nav
  { import = "plugins.oil" },

  -- Editing
  { import = "plugins.surround" },
  { import = "plugins.better-escape" },

  -- Git
  { import = "plugins.gitsigns" },
  { import = "plugins.gitblame" },
  { import = "plugins.conflict-marker" },
  { import = "plugins.lazygit" },

  -- Jujutsu
  { import = "plugins.lazyjj" },
  { import = "plugins.jj" },

  -- Debugging
  { import = "plugins.dap" },

  -- Tools
  { import = "plugins.obsidian" },
  { import = "plugins.otter" },
  { import = "plugins.startuptime" },
  { import = "plugins.atone" },
  { import = "plugins.mole" },

  -- Discord RPC
  { import = "plugins.cord" },
}
