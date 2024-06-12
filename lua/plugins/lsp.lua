return {
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "SlayerOfTheBad/idris2-nvim",
        cond = vim.fn.executable("idris2"),
        dependencies = {
            "neovim/nvim-lspconfig",
            "MunifTanjim/nui.nvim",
        },
        ft = { "idris2" },
        config = function()
            require("idris2-nvim").setup({
                server = require("plugins.lsp.idris2"),
                code_action_post_hook = function(_)
                    vim.cmd("write")
                end,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = {
            "Mason",
            "MasonUpdate",
            "MasonInstall",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
            },
            border = "rounded",
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        opts = {
            handlers = {
                function(server)
                    local lspconfig = require("lspconfig")
                    local base_conf = require("plugins.lsp.base_conf")
                    local status_ok, config = pcall(require, "plugins.lsp." .. server);
                    if status_ok then
                        lspconfig[server].setup(
                            vim.tbl_extend("force", base_conf, config)
                        )
                    else
                        lspconfig[server].setup(base_conf)
                    end
                end,
                ["rust_analyzer"] = function()
                end,
            },
        },
    },
    {
        "vigoux/ltex-ls.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
}
