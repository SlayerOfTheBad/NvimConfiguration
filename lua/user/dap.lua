local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return;
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/Documents/vscode-php-debug/out/phpDebug.js" }
}

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

---@diagnostic disable-next-line: redefined-local
local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  return;
end

dapui.setup()
