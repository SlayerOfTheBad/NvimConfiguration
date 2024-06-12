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
    -- Use Deftera186's fork because it includes fixes for NerdFonts v3.0.0
    "Deftera186/vim-devicons",
}
