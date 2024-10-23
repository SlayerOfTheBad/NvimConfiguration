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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "gruvbox"
            },
            extensions = {
                'mason',
                'neo-tree',
                'man',
                'fugitive',
                'toggleterm',
            },
            tabline = {
                lualine_a = { 'buffers' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'tabs' }
            },
        }
    },
    -- Use Deftera186's fork because it includes fixes for NerdFonts v3.0.0
    "Deftera186/vim-devicons",
}
