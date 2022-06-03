local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local opts = {
  ensure_installed = {
    "rust_analyzer",
    "phpactor",
    "eslint",
  },
  automatic_installation = true,
}

lsp_installer.setup(opts);

require "user.lsp.settings"
