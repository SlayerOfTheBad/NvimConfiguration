local status_ok, lspconfig = pcall(require, "lspconfig")
local status_ok_m, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok or not status_ok_m then
  return
end

local base_conf = require("user.lsp.settings.base_conf")

mason_lspconfig.setup_handlers({
  function (server)
    local status_ok, config = pcall(require, "user.lsp.settings."..server);
    if status_ok then
      lspconfig[server].setup(
        vim.tbl_extend("force", base_conf, config)
      )
    else
      lspconfig[server].setup(base_conf)
    end
  end,
})
