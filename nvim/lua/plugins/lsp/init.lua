-- LSP configuration init file
-- This file sets up the base LSP configuration and imports individual server configs

return {
	-- Base nvim-lspconfig setup
	{
		"nvim-lspconfig",
		auto_enable = true,
		lsp = function(plugin)
			vim.lsp.config(plugin.name, plugin.lsp or {})
			vim.lsp.enable(plugin.name)
		end,
		before = function(_)
			vim.lsp.config("*", {
				on_attach = function(_, bufnr)
					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end

					nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
					nmap("gr", function()
						Snacks.picker.lsp_references()
					end, "[G]oto [R]eferences")
					nmap("gI", function()
						Snacks.picker.lsp_implementations()
					end, "[G]oto [I]mplementation")
					nmap("<leader>ds", function()
						Snacks.picker.lsp_symbols()
					end, "[D]ocument [S]ymbols")
					nmap("<leader>ws", function()
						Snacks.picker.lsp_workspace_symbols()
					end, "[W]orkspace [S]ymbols")

					nmap("K", vim.lsp.buf.hover, "Hover Documentation")
					nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

					nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
					nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
					nmap("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "[W]orkspace [L]ist Folders")

					vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })
				end,
			})
		end,
	},
	-- Mason for non-nix environments
	{
		"mason.nvim",
		enabled = not nixInfo.isNix,
		priority = 100,
		on_plugin = { "nvim-lspconfig" },
		lsp = function(plugin)
			vim.cmd.MasonInstall(plugin.name)
		end,
	},
	-- lazydev for lua development
	{
		"lazydev.nvim",
		auto_enable = true,
		cmd = { "LazyDev" },
		ft = "lua",
		after = function(_)
			require("lazydev").setup({
				library = {
					{ words = { "nixInfo%.lze" }, path = nixInfo("lze", "plugins", "start", "lze") .. "/lua" },
					{
						words = { "nixInfo%.lze" },
						path = nixInfo("lzextras", "plugins", "start", "lzextras") .. "/lua",
					},
					"nvim-dap-ui",
				},
			})
		end,
	},
	-- Import individual LSP server configurations
	{ import = "plugins.lsp.lua_ls" },
	{ import = "plugins.lsp.nixd" },
	{ import = "plugins.lsp.bashls" },
	{ import = "plugins.lsp.hypr" },
}
