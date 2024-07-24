return {
    {
        "tpope/vim-fugitive",
        cmd = { "Git" },
    },
    {
        "akinsho/toggleterm.nvim",
        keys = { { "<C-\\>" } },
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.3
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-\>]],
            hide_numbers = true,
            autochdir = false,
            shade_terminals = true,
            shading_factor = -30,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = 'horizontal',
            close_on_exit = true,
            shell = vim.o.shell,
        }
    },
    {
        "harrisoncramer/gitlab.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "stevearc/dressing.nvim",     -- Recommended but not required. Better UI for pickers.
            "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
        },
        enabled = true,
        build = function() require("gitlab.server").build(true) end, -- Builds the Go binary
        config = function()
            local gitlab = require("gitlab")
            gitlab.setup()
            local opts = {}
            vim.keymap.set("n", "glb", gitlab.choose_merge_request)
            vim.keymap.set("n", "glr", gitlab.review)
            vim.keymap.set("n", "gls", gitlab.summary)
            vim.keymap.set("n", "glA", gitlab.approve)
            vim.keymap.set("n", "glR", gitlab.revoke)
            vim.keymap.set("n", "glc", gitlab.create_comment)
            vim.keymap.set("v", "glc", gitlab.create_multiline_comment)
            vim.keymap.set("v", "glC", gitlab.create_comment_suggestion)
            vim.keymap.set("n", "glO", gitlab.create_mr)
            vim.keymap.set("n", "glm", gitlab.move_to_discussion_tree_from_diagnostic)
            vim.keymap.set("n", "gln", gitlab.create_note)
            vim.keymap.set("n", "gld", gitlab.toggle_discussions)
            vim.keymap.set("n", "glaa", gitlab.add_assignee)
            vim.keymap.set("n", "glad", gitlab.delete_assignee)
            vim.keymap.set("n", "glla", gitlab.add_label)
            vim.keymap.set("n", "glld", gitlab.delete_label)
            vim.keymap.set("n", "glra", gitlab.add_reviewer)
            vim.keymap.set("n", "glrd", gitlab.delete_reviewer)
            vim.keymap.set("n", "glp", gitlab.pipeline)
            vim.keymap.set("n", "glo", gitlab.open_in_browser)
            vim.keymap.set("n", "glM", gitlab.merge)
            vim.keymap.set("n", "glu", gitlab.copy_mr_url)
            vim.keymap.set("n", "glP", gitlab.publish_all_drafts)
            vim.keymap.set("n", "glD", gitlab.toggle_draft_mode)
        end,
    },
}
