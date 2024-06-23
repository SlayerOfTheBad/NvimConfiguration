local gutentags_dir = vim.fs.normalize("~/.cache/gutentags");

return {
    {
        "willothy/flatten.nvim",
        lazy = false,
        priority = 1001,
        opts = {
            window = {
                open = "alternate"
            },
        },
    },
    {
        "preservim/tagbar",
        cmd = "Tagbar",
        dependencies = {
            {
                "skywind3000/gutentags_plus",
                dependencies = {
                    "ludovicchabant/vim-gutentags",
                    cond = vim.fn.executable("ctags"),
                    build = function()
                        vim.fn.mkdir(gutentags_dir, "p")
                    end,
                    config = function()
                        vim.g.gutentags_cache_dir = gutentags_dir
                    end,
                },
                config = function()
                    vim.g.gutentags_modules = { 'ctags' }
                end,
            },
        },
    },
    {
        "code-biscuits/nvim-biscuits",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            default_config = {
                min_distance = 15,
                prefix_string = " "
            },
            language_config = {
                rust = {
                    disabled = true,
                },
            },
        },
    },
    { import = "plugins.navigation" },
}
