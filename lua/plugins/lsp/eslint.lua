return {
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(
            bufnr,
            "Format",
            function(args)
                local options = {}
                if args.range > 0 then options.range = { start = { args.line1, 0 } } end
                if args.range > 1 then options.range["end"] = { args.line2, 0 } end
                vim.lsp.buf.format(options)

                vim.lsp.buf.execute_command({
                    command = 'eslint.applyAllFixes',
                    arguments = {
                        {
                            uri = vim.uri_from_bufnr(bufnr),
                            version = vim.lsp.util.buf_versions[bufnr],
                        },
                    },
                })
            end,
            {
                range = client.server_capabilities.documentRangeFormattingProvider,
                force = true,
            }
        )
    end
}
