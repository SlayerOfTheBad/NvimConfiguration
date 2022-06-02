local opts = { noremap = true, silent = true }

-- Shorten keymap command --
local keymap = vim.api.nvim_set_keymap

-- Normal mode --
-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<leader>e", ":Lex 20<CR>", opts)

--Navigate buffers--
keymap("n", "<S-j>", ":bnext<CR>", opts)
keymap("n", "<S-k>", ":bprevious<CR>", opts)

-- Insert empty line and stay in normal mode --
keymap("n", "oo", "o<ESC>", opts)
keymap("n", "OO", "O<ESC>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Open file explorer sidebar --
keymap("n", "<A-1>", ":Lex 30<CR>", opts)
