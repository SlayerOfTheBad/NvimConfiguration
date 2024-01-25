local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return;
end

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.3
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  autochdir = false,
  shade_terminals = true,
  shading_factor = -30,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
})
