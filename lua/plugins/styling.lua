return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function(lazy_config, opts)
            require("gruvbox").setup(opts)
            vim.o.background = "dark"
            vim.cmd([[colorscheme gruvbox]])
        end,
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
    {
        "rasulomaroff/reactive.nvim",
        opts = {
            builtin = {
                cursorline = true,
                cursor = true,
                modemsg = true,
            }
        },
    },
    {
        "echasnovski/mini.animate",
        version = '*',
        config = function(_, _)
            require('mini.animate').setup()
        end
    },
    "ryanoasis/vim-devicons",
}
