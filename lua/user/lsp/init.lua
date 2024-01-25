require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.settings")
require("user.lsp.idris2")
require("user.lsp.rustaceanvim")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client ~= nil and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(args.buf, true)
            vim.api.nvim_buf_create_user_command(args.buf, "InlayHintToggle",
                function() vim.lsp.inlay_hint.enable(args.buf, not vim.lsp.inlay_hint.is_enabled(args.buf)) end,
                {}
            )
        end
    end
})

