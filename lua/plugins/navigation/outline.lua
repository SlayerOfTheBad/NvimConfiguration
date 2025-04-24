return {
    {
        "hedyhli/outline.nvim",
        dependencies = {
            'epheien/outline-treesitter-provider.nvim'
        },
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            outline_window = {
                position = 'left',
                width = 20,
            },
            providers = {
                priority = { 'lsp', 'coc', 'markdown', 'norg', 'treesitter' }
            }
        },
    },
}
