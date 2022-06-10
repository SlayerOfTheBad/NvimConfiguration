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
