-- Lua language server configuration
return {
	"lua_ls",
	for_cat = "lua",
	lsp = {
		filetypes = { "lua" },
		settings = {
			Lua = {
				signatureHelp = { enabled = true },
				diagnostics = {
					globals = { "nixInfo", "vim" },
					disable = { "missing-fields" },
				},
			},
		},
	},
}
