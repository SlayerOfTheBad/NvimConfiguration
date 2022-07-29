local status_ok, tools = pcall(require, 'rust-tools')
if not status_ok then
  return
end

tools.setup({})

return {
  server = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
