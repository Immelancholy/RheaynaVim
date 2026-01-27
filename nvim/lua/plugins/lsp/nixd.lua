-- nixd (Nix language server) configuration
return {
	"nixd",
	enabled = nixInfo.isNix,
	for_cat = "nix",
	lsp = {
		filetypes = { "nix" },
		settings = {
			nixd = {
				nixpkgs = {
					expr = [[import <nixpkgs> {}]],
				},
				options = {},
				formatting = {
					command = { "alejandra" },
				},
				diagnostic = {
					suppress = {
						"sema-escaping-with",
					},
				},
			},
		},
	},
}
