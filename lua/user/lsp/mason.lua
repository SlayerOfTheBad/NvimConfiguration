local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local opts = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    border = "rounded",
  },
}

mason.setup(opts);

-- require "user.lsp.settings"