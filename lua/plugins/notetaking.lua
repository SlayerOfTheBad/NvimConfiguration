return {
    {
        "nvim-orgmode/orgmode",
        -- tag = "0.3.4",
        event = 'VeryLazy',
        ft = { 'org' },
        config = function(_, opts)
            local orgmode = require('orgmode')
            orgmode.setup(opts)
            local function command(name, action, desc)
                vim.api.nvim_create_user_command(name, function()
                    orgmode.action(action)
                end, { force = true, desc = desc, nargs = 0 })
            end
            command('OrgCapture', 'capture.prompt', 'Show orgmode capture prompt')
            command('OrgMenu', 'agenda.prompt', 'Show orgmode agenda prompt')
            command('OrgAgenda', 'agenda.agenda', 'Show orgmode agenda view')
            command('OrgTodos', 'agenda.todos', 'Show orgmode TODOs view')
            command('OrgMatch', 'agenda.tags', 'Show orgmode TODOs view')
            command('OrgSearch', 'agenda.search', 'Show orgmode search view')
        end,
        opts = {
            org_agenda_files = '~/Notes/**/*',
            org_default_notes_files = '~/Notes/refile.org',
            org_startup_folded = 'inherit',
            emacs_config = {
                config_path = '$HOME/.emacs.d/early-init.el',
            },
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
                            prompt = data.prompt,
                        }, handler)
                    end,
                },
            },
        }
    },
    {
        "chipsenkbeil/org-roam.nvim",
        config = function()
            require("org-roam").setup({
                directory = "~/Notes/org_roam",
                -- optional
                org_files = {
                    "~/Notes",
                },
            })
        end,
    },
    {
        "nvim-orgmode/org-bullets.nvim",
        config = function(_, opts)
            require('org-bullets').setup(opts)
        end,
        opts = {
            symbols = {
                checkboxes = {
                    half = { "󰡕", "@org.checkbox.halfchecked" },
                    done = { "󰸞", "@org.checkbox.checked" },
                    todo = { " ", "@org.checkbox" },
                },
            }
        },
    },
}
