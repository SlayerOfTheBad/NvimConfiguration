return {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    {
        "ldelossa/nvim-dap-projects",
        config = function()
            require("nvim-dap-projects").search_project_config()
        end
    },
    {
        "michaelb/sniprun",
        branch = "master",
        build = "sh install.sh",
    },
    {
        "t-troebst/perfanno.nvim",
        dependencies = {
            "ellisonleao/gruvbox.nvim",
        },
        setup = function()
            local perfanno = require("perfanno")
            local util = require("perfanno.util")

            local bgcolor = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui")

            perfanno.setup {
                -- Creates a 10-step RGB color gradient beween bgcolor and "#CC3300"
                line_highlights = util.make_bg_highlights(bgcolor, "#CC3300", 10),
                vt_highlight = util.make_fg_highlight("#CC3300"),
            }
        end
    }
}
