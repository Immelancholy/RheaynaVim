-- Autocommands configuration

local api = vim.api

-- Disable auto comment on enter
api.nvim_create_autocmd("FileType", {
	desc = "remove formatoptions",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Enable Copilot on VimEnter
api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Copilot enable")
	end,
})

-- Highlight on yank
local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Auto change working directory
api.nvim_create_augroup("WorkingDirectory", { clear = true })
api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.*" },
	callback = function()
		local path = vim.fn.expand("%:h") .. "/"
		path = "cd " .. path
		api.nvim_command(path)
	end,
	group = "WorkingDirectory",
})
