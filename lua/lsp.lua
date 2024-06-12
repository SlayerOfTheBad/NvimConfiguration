vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UsrLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil or client == false then return end
        local capabilities = client.server_capabilities
        if capabilities == nil then return end

        local bufnr = args.buf

        local opts = { noremap = true, silent = true }
        local usrcmd = vim.api.nvim_buf_create_user_command
        local keymap = vim.api.nvim_buf_set_keymap

        usrcmd(bufnr, "Hover", vim.lsp.buf.hover, {})
        keymap(bufnr, "n", "'", "<cmd>Hover<CR>", opts)
        usrcmd(bufnr, "CodeAction", function() vim.lsp.buf.code_action() end, {})
        keymap(bufnr, "n", "<leader>ca", "<cmd>CodeAction<CR>", opts)
        usrcmd(bufnr, "Diagnostics", vim.diagnostic.open_float, {})
        keymap(bufnr, "n", "<leader>f", "<cmd>Diagnostics<CR>", opts)
        usrcmd(bufnr, "DiagnosticsPrev", vim.diagnostic.goto_prev, {})
        keymap(bufnr, "n", "ek", "<cmd>DiagnosticsPrev<CR>", opts)
        usrcmd(bufnr, "DiagnosticsNext", vim.diagnostic.goto_next, {})
        keymap(bufnr, "n", "ej", "<cmd>DiagnosticsNext<CR>", opts)

        if capabilities.renameProvider then
            usrcmd(bufnr, "Rename", function() vim.lsp.buf.rename() end, {})
            keymap(bufnr, "n", "<leader>rn", "<cmd>Rename<CR>", opts)
        end

        if capabilities.signatureHelpProvider then
            usrcmd(bufnr, "SignatureHelp", vim.lsp.buf.signature_help, {})
            keymap(bufnr, "n", "<C-k>", "<cmd>SignatureHelp<CR>", opts)
        end

        if capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            usrcmd(
                bufnr,
                "InlayHintToggle",
                function()
                    vim.lsp.inlay_hint.enable(
                        not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                        { bufnr = bufnr }
                    )
                end,
                {}
            )
        end

        if capabilities.documentFormattingProvider then
            local range = capabilities.documentRangeFormattingProvider
            local usrcmd_opts = {}
            if range then
                usrcmd_opts.range = true
            end
            local fmt = function(options)
                return function(args)
                    if range and args.range > 0 then options.range = { start = { args.line1, 0 } } end
                    if range and args.range > 1 then options.range["end"] = { args.line2, 0 } end
                    vim.lsp.buf.format(options)
                end
            end
            usrcmd(bufnr, "FormatQuick", fmt({ timeout_ms = 1000 }), usrcmd_opts)
            usrcmd(bufnr, "Format", fmt({ async = true }), usrcmd_opts)
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = "UsrLspConfig",
                command = "FormatQuick",
                buffer = bufnr,
            })
        end

        if capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd("CursorHold", {
                group = "UsrLspConfig",
                callback = vim.lsp.buf.document_highlight,
                buffer = bufnr,
            }
            )
            vim.api.nvim_create_autocmd("CursorMoved", {
                group = "UsrLspConfig",
                callback = vim.lsp.buf.clear_references,
                buffer = bufnr,
            }
            )
        end

        if capabilities.referencesProvider then
            keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        end
        if capabilities.definitionProvider then
            keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        end
        if capabilities.typeDefinitionProvider then
            keymap(bufnr, "n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        end
        if capabilities.implementationProvider then
            keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        end
    end
})
