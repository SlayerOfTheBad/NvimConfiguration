local opts = {
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.execute_command({
            command = 'eslint.applyAllFixes',
            arguments = {
              {
                uri = vim.uri_to_bufnr(bufnr),
                version = lsp.util.buf_versions[bufnr],
              }
            }
          });
        end,
      },
    },
  },
}

return opts
