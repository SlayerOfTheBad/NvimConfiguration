return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function(lazy_config, opts)
            require("gruvbox").setup(opts)
            vim.o.background = "dark"
            vim.cmd([[colorscheme gruvbox]])
        end,
        opts = {
            terminal_colors = true,
            overrides = {
                DiffAdd = { bg = '#151333' }
            }
        },
    },
    {
        "vim-airline/vim-airline",
        dependencies = {
            "vim-airline/vim-airline-themes",
        },
        config = function(lazy_config, opts)
            vim.g.airline_theme = 'base16_gruvbox_dark_hard'
            vim.g.airline_powerline_fonts = 1
            vim.g["airline#extensions#tabline#enabled"] = 1
        end,
    },
    -- Use Deftera186's fork because it includes fixes for NerdFonts v3.0.0
    "Deftera186/vim-devicons",
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         lsp = {
    --             -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --             override = {
    --                 ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                 ["vim.lsp.util.stylize_markdown"] = true,
    --                 ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    --             },
    --         },
    --         -- you can enable a preset for easier configuration
    --         presets = {
    --             bottom_search = true,         -- use a classic bottom cmdline for search
    --             command_palette = true,       -- position the cmdline and popupmenu together
    --             long_message_to_split = true, -- long messages will be sent to a split
    --             inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    --             lsp_doc_border = false,       -- add a border to hover docs and signature help
    --         },
    --     },
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- },
}
