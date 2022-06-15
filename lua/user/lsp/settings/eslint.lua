local base_conf = require("user.lsp.settings.base_conf")

local opts = {
  on_attach = function(client, bufnr)
    base_conf.on_attach(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function ()
      vim.lsp.buf.execute_command({
        command = 'eslint.applyAllFixes',
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      })
    end, {})
  end,
}

return opts
