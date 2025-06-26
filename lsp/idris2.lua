local code_actions = require("idris2.code_action")
local metavars = require("idris2.metavars")
local repl = require("idris2.repl")

return {
    on_attach = function(client, buffer)
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ia", '', { callback = code_actions.add_clause });
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ic", '', { callback = code_actions.case_split });
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>iml", '', { callback = code_actions.make_lemma });
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>imc", '', { callback = code_actions.make_case });
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>imw", '', { callback = code_actions.make_with });
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>is", '', { callback = code_actions.expr_search });
        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ir", '', { callback = code_actions.refine_hole });

        vim.api.nvim_buf_set_keymap(
            buffer,
            "n",
            "<leader>itot",
            '',
            {
                callback = function()
                    local name = vim.fn.expand("<cword>")
                    repl.evaluate({ expr = ":total " .. name });
                end
            }
        );
        vim.api.nvim_buf_set_keymap(
            buffer,
            "n",
            "<leader>id",
            '',
            {
                callback = function()
                    local name = vim.fn.expand("<cword>")
                    repl.evaluate({ expr = ":doc " .. name });
                end
            }
        );

        vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ie", '', { callback = repl.evaluate });
        vim.api.nvim_buf_set_keymap(
            buffer,
            "v",
            "<leader>ie",
            '',
            { callback = function() repl.evaluate({ visual = true }) end }
        );
        vim.api.nvim_buf_set_keymap(
            buffer,
            "v",
            "<leader>ir",
            '',
            { callback = function() repl.evaluate({ visual = true, sub = true }) end }
        );

        repl.evaluate({ expr = ':set showtypes' })
    end,
}
