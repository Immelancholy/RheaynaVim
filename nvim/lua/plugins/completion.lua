-- blink.cmp and completion configuration
return {
	{
		"cmp-cmdline",
		auto_enable = true,
		on_plugin = { "blink.cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"blink.compat",
		auto_enable = true,
		dep_of = { "cmp-cmdline" },
	},
	{
		"colorful-menu.nvim",
		auto_enable = true,
		on_plugin = { "blink.cmp" },
	},
	{
		"blink.pairs",
		after = function(_)
			require("blink.pairs").setup({
				mappings = {
					-- you can call require("blink.pairs.mappings").enable()
					-- and require("blink.pairs.mappings").disable()
					-- to enable/disable mappings at runtime
					enabled = true,
					cmdline = true,
					-- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
					-- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
					disabled_filetypes = {},
					wrap = {
						-- move closing pair via motion
						["<C-b>"] = "motion",
						-- move opening pair via motion
						["<C-S-b>"] = "motion_reverse",
						-- set to 'treesitter' or 'treesitter_reverse' to use treesitter instead of motions
						-- set to nil, '' or false to disable the mapping
						-- normal_mode = {} <- for normal mode mappings, only supports 'motion' and 'motion_reverse'
					},
					-- see the defaults:
					-- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L52
					pairs = {},
				},
				highlights = {
					enabled = true,
					-- requires require('vim._extui').enable({}), otherwise has no effect
					cmdline = true,
					-- set to { 'BlinkPairs' } to disable rainbow highlighting
					groups = { "BlinkPairsOrange", "BlinkPairsPurple", "BlinkPairsBlue" },
					unmatched_group = "BlinkPairsUnmatched",

					-- highlights matching pairs under the cursor
					matchparen = {
						enabled = true,
						-- known issue where typing won't update matchparen highlight, disabled by default
						cmdline = false,
						-- also include pairs not on top of the cursor, but surrounding the cursor
						include_surrounding = false,
						group = "BlinkPairsMatchParen",
						priority = 250,
					},
				},
				debug = false,
			})
		end,
	},
	{
		"blink.cmp",
		auto_enable = true,
		event = "DeferredUIEnter",
		after = function(_)
			require("blink.cmp").setup({
				appearance = {
					kind_icons = {
						Text = "󰉿",
						Method = "󰊕",
						Function = "󰊕",
						Constructor = "󰒓",
						Field = "󰜢",
						Variable = "󰆦",
						Property = "󰖷",
						Class = "󱡠",
						Interface = "󱡠",
						Struct = "󱡠",
						Module = "󰅩",
						Unit = "󰪚",
						Value = "󰦨",
						Enum = "󰦨",
						EnumMember = "󰦨",
						Keyword = "󰻾",
						Constant = "󰏿",
						Snippet = "󱄽",
						Color = "󰏘",
						File = "󰈔",
						Reference = "󰬲",
						Folder = "󰉋",
						Event = "󱐋",
						Operator = "󰪚",
						TypeParameter = "󰬛",
					},
				},
				keymap = {
					preset = "default",
				},
				cmdline = {
					enabled = true,
					completion = {
						menu = {
							auto_show = true,
						},
					},
					sources = function()
						local type = vim.fn.getcmdtype()
						if type == "/" or type == "?" then
							return { "buffer" }
						end
						if type == ":" or type == "@" then
							return { "cmdline", "cmp_cmdline" }
						end
						return {}
					end,
				},
				fuzzy = {
					sorts = {
						"exact",
						"score",
						"sort_text",
					},
				},
				signature = {
					enabled = true,
					window = {
						show_documentation = true,
					},
				},
				completion = {
					menu = {
						draw = {
							treesitter = { "lsp" },
							components = {
								label = {
									text = function(ctx)
										return require("colorful-menu").blink_components_text(ctx)
									end,
									highlight = function(ctx)
										return require("colorful-menu").blink_components_highlight(ctx)
									end,
								},
								kind_icon = {
									text = function(ctx)
										-- default kind icon
										local icon = ctx.kind_icon
										-- if LSP source, check for color derived from documentation
										if ctx.item.source_name == "LSP" then
											local color_item = require("nvim-highlight-colors").format(
												ctx.item.documentation,
												{ kind = ctx.kind }
											)
											if color_item and color_item.abbr ~= "" then
												icon = color_item.abbr
											end
										end
										return icon .. ctx.icon_gap
									end,
									highlight = function(ctx)
										-- default highlight group
										local highlight = "BlinkCmpKind" .. ctx.kind
										-- if LSP source, check for color derived from documentation
										if ctx.item.source_name == "LSP" then
											local color_item = require("nvim-highlight-colors").format(
												ctx.item.documentation,
												{ kind = ctx.kind }
											)
											if color_item and color_item.abbr_hl_group then
												highlight = color_item.abbr_hl_group
											end
										end
										return highlight
									end,
								},
							},
						},
					},
					documentation = {
						auto_show = true,
					},
				},
				sources = {
					default = { "lsp", "path", "buffer", "omni" },
					providers = {
						path = {
							score_offset = 50,
						},
						lsp = {
							score_offset = 40,
						},
						cmp_cmdline = {
							name = "cmp_cmdline",
							module = "blink.compat.source",
							score_offset = -100,
							opts = {
								cmp_name = "cmdline",
							},
						},
					},
				},
			})
		end,
	},
}
