vim.g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-v"] = "vsplit",
  ["ctrl-s"] = "split",
}
vim.g.fzf_layout = {
  left = "30%"
}
vim.g.fzf_history_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "fzf_history")
vim.g.fzf_vim = {
  preview_window = {'up,50%', 'ctrl-/'}
}
-- vim.g.fzf_vim.preview_window = "value"
-- vim.g["fzf_vim.preview_window"] = {'up,50%', 'ctrl-/'}
