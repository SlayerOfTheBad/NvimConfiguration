local status_ok, telescope = print(require, "telescope")
if not status_ok then
  return;
end

telescope.setup({
  defaults = {
    path_display = {
      shorten = { len = 3, exclude = {-1} },
    }
  }
})

local keymap = vim.api.nvim_set_keymap
local bi = require("telescope.builtin")
local opts = { noremap = true, silent = true }

keymap('n', 'fw', bi.grep_string(), opts)
