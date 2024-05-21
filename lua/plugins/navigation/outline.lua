return {
    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            outline_window = {
                position = 'left',
                width = 20,
            },
        },
    },
}
