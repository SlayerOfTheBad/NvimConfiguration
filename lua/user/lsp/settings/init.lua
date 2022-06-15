local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsp_servers = {
  "jsonls",
  "sumneko_lua",
  "rust_analyzer",
  "phpactor",
  "eslint",
  "bashls",
}

local base_conf = require("user.lsp.settings.base_conf")

for _,server in ipairs(lsp_servers) do
  local status_ok, config = pcall(require, "user.lsp.settings."..server)
  local add_conf = {}
  if status_ok then
    add_conf = config
  end
  lspconfig[server].setup(
    vim.tbl_extend("force", base_conf, add_conf)
  )
end
