local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

keymap("n", "<A-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<A-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<A-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Insert empty line and stay in normal mode --
keymap("n", "oo", "o<ESC>", opts)
keymap("n", "OO", "O<ESC>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- Buffer navigation --
keymap("n", "bpp", "<cmd>previous|bd#<CR>", opts)
keymap("n", "bnn", "<cmd>w|next|bd#|mksession!<CR>", opts)
keymap("n", "bpd", "<cmd>bp|bd#<CR>", opts)
keymap("n", "bnd", "<cmd>bn|bd#<CR>", opts)
