local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return;
end

toggleterm.setup({
  open_mapping = [[<C-\>]],
  direction = 'float',
  start_in_insert = true,
  persist_mode = true,
  close_on_exit = true,
  shell = vim.o.shell,
})
