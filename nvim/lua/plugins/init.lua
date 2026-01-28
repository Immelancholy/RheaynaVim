-- Plugins initialization file
-- This file imports all plugin configurations using lze's import spec

return {
	-- UI and appearance
	{ import = "plugins.mini-base16" },
	{ import = "plugins.noice" },
	{ import = "plugins.snacks" },
	{ import = "plugins.lualine" },
	{ import = "plugins.indent-blankline" },
	{ import = "plugins.mini-icons" },
	{ import = "plugins.tiny-inline-diagnostic" },
	{ import = "plugins.fidget" },
	{ import = "plugins.which-key" },

	-- LSP and language support
	{ import = "plugins.lsp" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.conform" },
	{ import = "plugins.lint" },

	-- Completion
	{ import = "plugins.completion" },
	{ import = "plugins.copilot" },

	-- Navigation
	{ import = "plugins.harpoon" },
	{ import = "plugins.flash" },

	-- Editing
	{ import = "plugins.surround" },
	{ import = "plugins.better-escape" },

	-- Git
	{ import = "plugins.gitsigns" },
	{ import = "plugins.gitblame" },
	{ import = "plugins.conflict-marker" },

	-- Debugging
	{ import = "plugins.dap" },

	-- Tools
	{ import = "plugins.obsidian" },
	{ import = "plugins.otter" },
	{ import = "plugins.opencode" },
	{ import = "plugins.startuptime" },
	{ import = "plugins.atone" },
}
