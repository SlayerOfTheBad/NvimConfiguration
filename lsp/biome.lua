local util = require("lspconfig.util")


return {
    on_attach = function(client, bufnr)
        local lsp = vim.lsp.buf;
        local opts = { noremap = true, silent = true }
        local usrcmd = vim.api.nvim_buf_create_user_command
        local keymap = vim.api.nvim_buf_set_keymap

        usrcmd(bufnr, "Rename", function() lsp.rename() end, {})
        keymap(bufnr, "n", "<leader>rn", "<cmd>Rename<CR>", opts)

        usrcmd(bufnr, "SignatureHelp", lsp.signature_help, {})
        keymap(bufnr, "n", "<C-k>", "<cmd>SignatureHelp<CR>", opts)

        keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        local function fmt(options)
            return function(args)
                lsp.format(options)
            end
        end

        vim.bo[bufnr].formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:1000})'
        usrcmd(bufnr, "FormatQuick", fmt({ timeout_ms = 1000 }), {})
        usrcmd(bufnr, "Format", fmt({ async = true }), {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = "UsrLspConfig",
            command = "FormatQuick",
            buffer = bufnr,
        })
    end,
    root_dir = function(fname)
        return util.root_pattern("biome.json", "biome.jsonc")(fname)
            or util.find_package_json_ancestor(fname)
            or util.find_node_modules_ancestor(fname)
            or util.find_git_ancestor(fname)
    end,
}
