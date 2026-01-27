-- RheaynaVim - Neovim Configuration
-- A modular neovim configuration using lze for lazy loading

-- Load core configuration
require("core.options")

-- Set up lze handlers and nix integration (must be before plugins)
local nixInfo = require("core.handlers")

-- Set up nvim-notify early
vim.notify = require("notify")

-- Load keymaps
require("core.keymaps")

-- Load autocommands
require("core.autocmds")

-- Load all plugins via lze
nixInfo.lze.load("plugins")
