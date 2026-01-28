-- snacks.nvim configuration
return {
	"snacks.nvim",
	auto_enable = true,
	lazy = false,
	priority = 1000,
	after = function(plugin)
		-- Custom indent highlight color
		vim.api.nvim_set_hl(0, "MySnacksIndent", { fg = "#32a88f" })
		require("snacks").setup({
			dashboard = {
				enabled = true,
				width = 60,
				row = nil,
				col = nil,
				pane_gap = 4,
				autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
				preset = {
					pick = nil,
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "o",
							desc = "Notes",
							action = ":lua Snacks.dashboard.pick('files', {cwd = os.getenv('NOTES_PATH')})",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{
							icon = "󰒲 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[
⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿
⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿
⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿
⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿
⣿⢸⣿⡅⣠⣬⣥⣤⣴⣴⣿⣿⢿⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀
⡟⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶
⡧⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿
⡇⣿⠃⣿⣿⣿⣿⣿⠛⠛⢫⣿⣿⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿
⡇⣿⠘⡇⢻⣿⣿⣿⡆⠀⠀⠀⠀⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁
⡇⣿⠀⠘⢿⣿⣿⣿⣧⢠⣤⠀⡤⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉
⣧⢻⠀⡄⠀⠹⣿⣿⣿⡸⣿⣾⡆⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶
⣿⡘⠈⣷⠀⠀⠈⠻⣿⣷⣎⠐⠿⢟⣋⣤⣾⣿⣿⣿⡿⠟⣩⠖⢠⡬⠈⠀
⣿⣧⠁⢻⡇⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⢀⠈⢀⡴⠈⠁⠀⠀
⠻⣿⣆⠘⣿⠀⠀  ⠀⠈⠙⠛⠋⠉⠀⠀⠀⠀⡀⠤⠚⠁     
	
██████╗ ██╗  ██╗███████╗ █████╗ ██╗   ██╗███╗   ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗
██╔══██╗██║  ██║██╔════╝██╔══██╗╚██╗ ██╔╝████╗  ██║██╔══██╗██║   ██║██║████╗ ████║
██████╔╝███████║█████╗  ███████║ ╚████╔╝ ██╔██╗ ██║███████║██║   ██║██║██╔████╔██║
██╔══██╗██╔══██║██╔══╝  ██╔══██║  ╚██╔╝  ██║╚██╗██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██║██║  ██║███████╗██║  ██║   ██║   ██║ ╚████║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝


					]],
				},
				formats = {
					icon = function(item)
						if item.file and item.icon == "file" or item.icon == "directory" then
							return Snacks.dashboard.icon(item.file, item.icon)
						end
						return { item.icon, width = 2, hl = "icon" }
					end,
					footer = { "%s", align = "center" },
					header = { "%s", align = "center" },
					file = function(item, ctx)
						local fname = vim.fn.fnamemodify(item.file, ":~")
						fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
						if #fname > ctx.width then
							local dir = vim.fn.fnamemodify(fname, ":h")
							local file = vim.fn.fnamemodify(fname, ":t")
							if dir and file then
								file = file:sub(-(ctx.width - #dir - 2))
								fname = dir .. "/…" .. file
							end
						end
						local dir, file = fname:match("^(.*)/(.+)$")
						return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
							or { { fname, hl = "file" } }
					end,
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
				},
			},
			explorer = { replace_netrw = true },
			picker = {
				sources = {
					explorer = {
						auto_close = true,
					},
				},
			},
			git = {},
			terminal = {},
			scope = {},
			indent = {
				scope = {
					hl = "MySnacksIndent",
				},
				chunk = {
					hl = "MySnacksIndent",
				},
			},
			statuscolumn = {
				left = { "mark", "git" },
				right = { "sign", "fold" },
				folds = {
					open = false,
					git_hl = false,
				},
				git = {
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 50,
			},
			lazygit = {
				config = {
					os = {
						editPreset = "nvim-remote",
						edit = vim.v.progpath
							.. [=[ --server "$NVIM" --remote-send '<cmd>lua nixInfo.lazygit_fix({{filename}})<CR>']=],
						editAtLine = vim.v.progpath
							.. [=[ --server "$NVIM" --remote-send '<cmd>lua nixInfo.lazygit_fix({{filename}}, {{line}})<CR>']=],
						openDirInEditor = vim.v.progpath
							.. [=[ --server "$NVIM" --remote-send '<cmd>lua nixInfo.lazygit_fix({{dir}})<CR>']=],
						editAtLineAndWait = nixInfo(vim.v.progpath, "progpath") .. " +{{line}} {{filename}}",
					},
				},
			},
		})

		-- Handle the backend of lazygit remote commands
		nixInfo.lazygit_fix = function(path, line)
			local prev = vim.fn.bufnr("#")
			local prev_win = vim.fn.bufwinid(prev)
			vim.api.nvim_feedkeys("q", "n", false)
			if line then
				vim.api.nvim_buf_call(prev, function()
					vim.cmd.edit(path)
					local buf = vim.api.nvim_get_current_buf()
					vim.schedule(function()
						if buf then
							vim.api.nvim_win_set_buf(prev_win, buf)
							vim.api.nvim_win_set_cursor(0, { line or 0, 0 })
						end
					end)
				end)
			else
				vim.api.nvim_buf_call(prev, function()
					vim.cmd.edit(path)
					local buf = vim.api.nvim_get_current_buf()
					vim.schedule(function()
						if buf then
							vim.api.nvim_win_set_buf(prev_win, buf)
						end
					end)
				end)
			end
		end

		-- Snacks keymaps
		vim.keymap.set("n", "-", function()
			Snacks.explorer.open()
		end, { desc = "Snacks file explorer" })
		vim.keymap.set("n", "<c-\\>", function()
			Snacks.terminal.open()
		end, { desc = "Snacks Terminal" })
		vim.keymap.set("n", "<leader>_", function()
			Snacks.lazygit.open()
		end, { desc = "Snacks LazyGit" })
		vim.keymap.set("n", "<leader>sf", function()
			Snacks.picker.smart()
		end, { desc = "Smart Find Files" })
		vim.keymap.set("n", "<leader><leader>s", function()
			Snacks.picker.buffers()
		end, { desc = "Search Buffers" })
		-- find
		vim.keymap.set("n", "<leader>ff", function()
			Snacks.picker.files()
		end, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", function()
			Snacks.picker.git_files()
		end, { desc = "Find Git Files" })
		-- Grep
		vim.keymap.set("n", "<leader>sb", function()
			Snacks.picker.lines()
		end, { desc = "Buffer Lines" })
		vim.keymap.set("n", "<leader>sB", function()
			Snacks.picker.grep_buffers()
		end, { desc = "Grep Open Buffers" })
		vim.keymap.set("n", "<leader>sg", function()
			Snacks.picker.grep()
		end, { desc = "Grep" })
		vim.keymap.set({ "n", "x" }, "<leader>sw", function()
			Snacks.picker.grep_word()
		end, { desc = "Visual selection or ord" })
		-- search
		vim.keymap.set("n", "<leader>sd", function()
			Snacks.picker.diagnostics()
		end, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>sD", function()
			Snacks.picker.diagnostics_buffer()
		end, { desc = "Buffer Diagnostics" })
		vim.keymap.set("n", "<leader>sh", function()
			Snacks.picker.help()
		end, { desc = "Help Pages" })
		vim.keymap.set("n", "<leader>sj", function()
			Snacks.picker.jumps()
		end, { desc = "Jumps" })
		vim.keymap.set("n", "<leader>sk", function()
			Snacks.picker.keymaps()
		end, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>sl", function()
			Snacks.picker.loclist()
		end, { desc = "Location List" })
		vim.keymap.set("n", "<leader>sm", function()
			Snacks.picker.marks()
		end, { desc = "Marks" })
		vim.keymap.set("n", "<leader>sM", function()
			Snacks.picker.man()
		end, { desc = "Man Pages" })
		vim.keymap.set("n", "<leader>sq", function()
			Snacks.picker.qflist()
		end, { desc = "Quickfix List" })
		vim.keymap.set("n", "<leader>sR", function()
			Snacks.picker.resume()
		end, { desc = "Resume" })
		vim.keymap.set("n", "<leader>su", function()
			Snacks.picker.undo()
		end, { desc = "Undo History" })
	end,
}
