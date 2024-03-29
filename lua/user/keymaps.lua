local opts = { noremap = true, silent = true }

-- Shorten keymap command --
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode --
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

-- Open file explorer sidebar --
-- keymap("n", "\\", "<cmd>Neotree filesystem float reveal<CR>", opts)
-- keymap("n", "<leader>b", "<cmd>Neotree toggle show buffers float<CR>", opts)
-- keymap("n", "<leader>g", "<cmd>Neotree toggle show git_status float<CR>", opts)
keymap("n", "\\", "<cmd>NnnExplorer<CR>", opts)

-- Telescope --
-- keymap("n", "ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- keymap("n", "fw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
-- keymap("n", "fd", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- keymap("n", "fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)

-- FZF --
keymap("n", "ff", "<cmd>FZF<CR>", opts)
keymap("n", "fd", "<cmd>RG<CR>", opts)
keymap("n", "<leader>b", "<cmd>Buffers<CR>", opts)
keymap("n", "<leader>g", "<cmd>GFiles?<CR>", opts)

-- Terminal --
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- Buffer navigation --
keymap("n", "bpp", "<cmd>previous|bd#<CR>", opts)
keymap("n", "bnn", "<cmd>w|next|bd#|mksession!<CR>", opts)
keymap("n", "bpd", "<cmd>bp|bd#<CR>", opts)
keymap("n", "bnd", "<cmd>bn|bd#<CR>", opts)

-- vim.api.nvim_add_user_command('FuckMyChanges', 's/\\v\\<{7}.*\\n((.*\\n){-})\\={7}(.*\\n){-}\\>{7}.*\\n/\\1/g')
