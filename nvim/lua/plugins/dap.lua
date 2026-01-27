-- DAP (Debug Adapter Protocol) configuration
return {
	{
		"nvim-dap-virtual-text",
		event = "VimEnter",
		after = function(plugin)
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"nvim-dap",
		event = "VimEnter",
		after = function(plugin)
			local dap = require("dap")
			local dapui = require("dapui")

			dap.adapters = {
				codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = vim.env.CODELLDB_PATH,
						args = { "--port", "${port}" },
					},
				},
			}

			dap.configurations = {
				rust = {
					{
						name = "Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
				},
				cpp = {
					{
						name = "Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
						end,
						cwd = "${workspaceFolder}",
					},
				},
				c = {
					{
						name = "Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
						end,
						cwd = "${workspaceFolder}",
					},
				},
			}

			vim.keymap.set("n", "<leader>cdk", function()
				dap.continue()
			end, { desc = "Dap Continue" })
			vim.keymap.set("n", "<leader>cdl", function()
				dap.run_last()
			end, { desc = "Dap Run Last" })
			vim.keymap.set("n", "<leader>b", function()
				dap.toggle_breakpoint()
			end, { desc = "Dap Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>cdu", function()
				dapui.toggle()
			end, { desc = "Dap UI Toggle" })

			vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
		end,
	},
}
