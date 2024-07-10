return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        main = 'rainbow-delimiters.setup',
        opts = {
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterOrange',
                'RainbowDelimiterYellow',
                'RainbowDelimiterGreen',
                'RainbowDelimiterBlue',
                'RainbowDelimiterViolet',
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        init = function()
            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
        end,
        main = "nvim-treesitter.configs",
        opts = {
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "rasulomaroff/reactive.nvim",
        event = "UIEnter",
        dependencies = {
            "miversen33/sunglasses.nvim",
        },
        opts = {
            load = {
                'gruvbox',
            }
        },
    },
    {
        "miversen33/sunglasses.nvim",
        config = true,
        event = "UIEnter",
    },
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
    },
    {
        "RRethy/vim-hexokinase",
        build = "make hexokinase",
        init = function()
            vim.g.Hexokinase_highlighters = { 'virtual' }
            vim.g.Hexokinase_virtualText = ' 󰏙'
        end
    },
}
