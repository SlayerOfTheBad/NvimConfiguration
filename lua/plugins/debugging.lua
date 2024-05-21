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
}
