return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { 'string' },
                javascript = { 'template_string' },
            },
            disable_filetype = {
                "TelescopePromts",
            },
            fast_wrap = {
                map = '<M-e>',
                chars = { '{', '[', '(', '"', "'" },
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                end_key = '$',
                keys = 'asdfjkl;',
                check_comma = true,
                highlight = 'Search',
                highlight_grey = 'Comment',
            }
        }
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    {
        "petertriho/cmp-git",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "lukas-reineke/cmp-rg",
        cond = vim.fn.executable("rg"),
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function(_, _)
            local cmp = require("cmp")

            local kind_icons = {
                Text = " ",
                Method = "m",
                Function = "󰊕",
                Constructor = " ",
                Field = " ",
                Variable = "󰫧 ",
                Class = "󰌗 ",
                Interface = " ",
                Module = " ",
                Property = " ",
                Unit = " ",
                Value = "󰎠 ",
                Enum = " ",
                Keyword = "󰌋 ",
                Snippet = " ",
                Color = "󰏘 ",
                File = "󰈙 ",
                Reference = " ",
                Folder = " ",
                EnumMember = " ",
                Constant = "󰇽 ",
                Struct = " ",
                Event = " ",
                Operator = "󰆕 ",
                TypeParameter = "󰊄",
            }

            cmp.setup(
                {
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end
                    },
                    mapping = {
                        ["<C-k>"] = cmp.mapping.select_prev_item(),
                        ["<C-j>"] = cmp.mapping.select_next_item(),
                        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                        ["<C-e>"] = cmp.mapping {
                            i = cmp.mapping.abort(),
                            c = cmp.mapping.close(),
                        },
                        -- Accept currently selected item. If none selected, `select` first item.
                        -- Set `select` to `false` to only confirm explicitly selected items.
                        ["<CR>"] = cmp.mapping.confirm { select = false },
                    },
                    formatting = {
                        fields = { "kind", "abbr", "menu" },
                        format = function(entry, vim_item)
                            -- Kind icons
                            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                            vim_item.menu = ({
                                nvim_lsp = "[LSP]",
                                nvim_lua = "[NVim-lua]",
                                luasnip = "[Snippet]",
                                buffer = "[Buffer]",
                                path = "[Path]",
                                crates = "[Crates]",
                                rg = "[RipGrep]",
                                git = "[Git]",
                            })[entry.source.name]
                            return vim_item
                        end,
                    },
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "nvim_lua" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = "path" },
                        { name = "crates" },
                        { name = "rg",      keyword_length = 3 },
                        { name = "git" },
                        { name = "otter" },
                    },
                    confirm_opts = {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    },
                    window = {
                        documentation = cmp.config.window.bordered(),
                    },
                    experimental = {
                        ghost_text = false,
                        native_menu = false,
                    },
                }
            )

            local npairs_cmp = require("nvim-autopairs.completion.cmp")

            cmp.event:on(
                'confirm_done',
                npairs_cmp.on_confirm_done()
            )
        end,
    },
}
