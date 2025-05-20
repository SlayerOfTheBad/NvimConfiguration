return {
    {
        "amitds1997/remote-nvim.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
        opts = {
            client_callback = function(port, workspace_config)
                local cmd = ("kitty -1 -e nvim --server localhost:%s --remote-ui"):format(port)
                vim.fn.jobstart(cmd, {
                    detach = true,
                    on_exit = function(job_id, exit_code, event_type)
                        -- This function will be called when the job exits
                        print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
                    end,
                })
            end,
        }
    }
}
