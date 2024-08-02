return {
    {
        "nvim-orgmode/orgmode",
        tag = "0.3.4",
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            require('orgmode').setup({
                org_agenda_files = '~/Notes/**/*',
                org_default_notes_files = '~/Notes/refile.org',
                ui = {
                    menu = {
                        handler = function(data)
                            -- your handler here, for example:
                            local options = {}
                            local options_by_label = {}
                            for _, item in ipairs(data.items) do
                                -- Only MenuOption has `key`
                                -- Also we don't need `Quit` option because we can close the menu with ESC
                                if item.key and item.label:lower() ~= "quit" then
                                    table.insert(options, item.label)
                                    options_by_label[item.label] = item
                                end
                            end
                            local handler = function(choice)
                                if not choice then
                                    return
                                end
                                local option = options_by_label[choice]
                                if option.action then
                                    option.action()
                                end
                            end
                            vim.ui.select(options, {
                                propmt = data.propmt,
                            }, handler)
                        end,
                    },
                },
            })
        end
    },
    {
        "chipsenkbeil/org-roam.nvim",
        tag = "0.1.0",
        dependencies = {
            {
                "nvim-orgmode/orgmode",
            },
        },
        config = function()
            require("org-roam").setup({
                directory = "~/Notes/org_roam",
                -- optional
                org_files = {
                    "~/Notes",
                },
            })
        end
    },
    "nvim-orgmode/org-bullets.nvim",
}
