local enable_fzf_native = vim.fn.executable("make") and (vim.fn.executable("clang") or vim.fn.executable("gcc"));

return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true,
        cond = enable_fzf_native,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "BurntSushi/ripgrep",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "FabianWirth/search.nvim",
        },
        cmd = "Telescope",
        keys = {
            { "ff", "<cmd>Telescope find_files<CR>", },
            { "fw", "<cmd>Telescope grep_string<CR>", },
            { "fd", "<cmd>Telescope live_grep<CR>", },
        },
        config = function(_, _)
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = {
                        shorten = { len = 3, exclude = { -2, -1 } },
                    },
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,

                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,

                            ["<C-c>"] = actions.close,

                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,

                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,

                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,

                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,

                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-l>"] = actions.complete_tag,
                            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                        },

                        n = {
                            ["<esc>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,

                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["H"] = actions.move_to_top,
                            ["M"] = actions.move_to_middle,
                            ["L"] = actions.move_to_bottom,

                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["gg"] = actions.move_to_top,
                            ["G"] = actions.move_to_bottom,

                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,

                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,

                            ["?"] = actions.which_key,
                        },
                    },
                },
            })

            pcall(telescope.load_extension, 'fzf')
        end
    },
}
