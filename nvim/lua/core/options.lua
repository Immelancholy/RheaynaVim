-- Neovim options configuration
-- See `:help vim.o`

vim.loader.enable() -- bytecode caching

-- Set leaders before any plugins with keybinds are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Display options
vim.o.conceallevel = 2
vim.o.termguicolors = true

-- Allow .nvim.lua in current dir and parents (project config)
vim.o.exrc = false

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Search options
vim.opt.hlsearch = true
vim.opt.inccommand = "split" -- Preview substitutions live

-- Scrolling
vim.opt.scrolloff = 10

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

-- Mouse
vim.o.mouse = "a"

-- Indentation
vim.opt.cpoptions:append("I")
vim.o.expandtab = true
vim.o.breakindent = true

-- Undo
vim.o.undofile = true

-- Search case sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Completion
vim.o.completeopt = "menu,preview,noselect"

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Required for opencode `opts.events.reload`
vim.o.autoread = true

-- Netrw settings
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0
