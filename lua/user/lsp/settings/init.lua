local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, jsonls = pcall(require, "user.lsp.settings.jsonls")
if status_ok then
  lspconfig.jsonls.setup(jsonls)
end
