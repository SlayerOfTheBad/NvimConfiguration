local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("t", "\\", "<cmd>NnnExplorer<CR>", opts)
