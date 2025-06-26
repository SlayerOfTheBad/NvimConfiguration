vim.lsp.config('clangd', {
    cmd = {
        '/home/jacob/Projects/llvm-project/build/bin/clangd',
        -- '--pch-storage=memory'
    },
    on_attach = function(client, bufnr)
        -- require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "FormatQuick", function() end, {})
    end
})
