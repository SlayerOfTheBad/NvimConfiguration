return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "idris-community/idris2-nvim",
        cond = vim.fn.executable("idris2"),
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        ft = { "idris2" },
        config = function()
            require("idris2").setup({
                server = require("plugins.lsp.idris2"),
                code_action_post_hook = function(action)
                    if action ~= nil then
                        vim.cmd("write")
                    end
                end,
                use_default_semantic_hl_groups = false,
                default_regexp_syntax = false,
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
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
                -- used for completion, annotations and signatures of Neovim apis
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "luvit-meta/library",      words = { "vim%.uv" } },
                        { path = "/usr/share/awesome/lib/", words = { "awesome" } },
                    },
                },
            },
        }
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
    {
        "jmbuhr/otter.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        ft = {
            'md',
            'markdown',
            'org',
        },
        opts = {
            lsp = {
                diagnostic_update_events = {
                    "BufWritePost",
                    "InsertLeave",
                    "TextChanged",
                },
            },
            buffers = { set_filetype = true, },
            handle_leading_whitespace = true,
        }
    }
}
