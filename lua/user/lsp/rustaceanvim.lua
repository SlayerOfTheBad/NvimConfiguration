vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ["rust-analyzer"] = {
        completion = {
          fullFunctionSignatures = {
            enable = true,
          },
        },
        references = {
          excludeImports = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
