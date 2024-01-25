local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return;
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/Documents/vscode-php-debug/out/phpDebug.js" }
}

-- dap.adapters.lldb = function(on_adapter)
--   local default_adapter = require("rustaceanvim.config.internal").dap.adapter()
--   local adapter = vim.deepcopy(default_adapter);

--   adapter.sourceLanguages = { }
--   adapter.enrich_config = function(config, on_config)
--     config.initCommands = {}
--     on_config(config)
--   end

--   on_adapter(adapter)
-- end

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}"
    }
  }
}

require('nvim-dap-projects').search_project_config()

---@diagnostic disable-next-line: redefined-local
local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  return;
end

dapui.setup()
