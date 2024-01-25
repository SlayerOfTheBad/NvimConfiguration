require("dap")

require('nvim-dap-projects').search_project_config()

---@diagnostic disable-next-line: redefined-local
local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  return;
end

dapui.setup()
