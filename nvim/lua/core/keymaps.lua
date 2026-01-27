-- Basic keymaps configuration
-- Plugin-specific keymaps are in their respective plugin files

local keymap = vim.keymap.set

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves Line Down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves Line Up" })

-- Centered scrolling
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
keymap("n", "n", "nzzzv", { desc = "Next Search Result" })
keymap("n", "N", "Nzzzv", { desc = "Previous Search Result" })

-- Buffer navigation
keymap("n", "<leader><leader>[", "<cmd>bprev<CR>", { desc = "Previous buffer" })
keymap("n", "<leader><leader>]", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader><leader>l", "<cmd>b#<CR>", { desc = "Last buffer" })
keymap("n", "<leader><leader>d", "<cmd>bdelete<CR>", { desc = "delete buffer" })

-- Word wrap navigation
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostics
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Clipboard keymaps
keymap({ "v", "x", "n" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
keymap({ "n", "v", "x" }, "<leader>Y", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
keymap({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
keymap("i", "<C-p>", "<C-r><C-p>+", { noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" })
keymap("x", "<leader>P", '"_dP', { noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" })

-- Increment/Decrement remaps (freeing C-a and C-x for opencode)
keymap("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
keymap("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
