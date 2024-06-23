return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "\\",        "<cmd>Neotree toggle left reveal<CR>", },
            { "<leader>b", "<cmd>Neotree toggle buffers right<CR>", },
            { "<leader>g", "<cmd>Neotree toggle git_status<CR>", },
        },
        cmd = "Neotree",
        opts = {
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(_)
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "✖", -- this can only be used in the git_status source
                        renamed   = " ", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = " ",
                        unstaged  = "󰅘 ",
                        staged    = " ",
                        conflict  = " ",
                    },
                },
            },
            document_symbols = {
                kinds = {
                    File = { icon = "󰈙 ", hl = "Tag" },
                    Namespace = { icon = "󰌗 ", hl = "Include" },
                    Package = { icon = "󰏖 ", hl = "Label" },
                    Class = { icon = "󰌗 ", hl = "Include" },
                    Property = { icon = "󰆧 ", hl = "@property" },
                    Enum = { icon = " ", hl = "@number" },
                    Function = { icon = "󰊕", hl = "Function" },
                    String = { icon = "󰀬 ", hl = "String" },
                    Number = { icon = "󰎠 ", hl = "Number" },
                    Array = { icon = "󰅪 ", hl = "Type" },
                    Object = { icon = "󰅩 ", hl = "Type" },
                    Key = { icon = "󰌋 ", hl = "" },
                    Struct = { icon = "󰌗 ", hl = "Type" },
                    Operator = { icon = "󰆕 ", hl = "Operator" },
                    TypeParameter = { icon = "󰊄", hl = "Type" },
                    StaticMethod = { icon = '󰠄 ', hl = 'Function' },
                }
            },
            -- Add this section only if you've configured source selector.
            source_selector = {
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                },
            },
            buffers = {
                show_unloaded = true,
                window = {
                    mappings = {
                        ["d"] = "buffer_delete",
                    },
                },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
            hijack_netrw_behaviour = "open_current",
        }
    },
}
