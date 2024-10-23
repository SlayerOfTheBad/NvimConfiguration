return {
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "FormatQuick", function() end, {})
    end
}
