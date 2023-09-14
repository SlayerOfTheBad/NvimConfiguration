local base_conf = require("user.lsp.settings.base_conf")

local status_ok, code_actions = pcall(require, "idris2.code_action")
if not status_ok then
  return
end

local status_ok, metavars = pcall(require, "idris2.metavars")
if not status_ok then
  return
end

local status_ok, repl = pcall(require, "idris2.repl")
if not status_ok then
  return
end

local config = {
  on_attach = function(client, buffer)
    local opts = { noremap = true, silent = true }
    base_conf.on_attach(client, buffer);

    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ida",  '', { callback = code_actions.add_clause  });
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>idc",  '', { callback = code_actions.case_split  });
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>idml", '', { callback = code_actions.make_lemma  });
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>idmc", '', { callback = code_actions.make_case   });
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>idmw", '', { callback = code_actions.make_with   });
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ids",  '', { callback = code_actions.expr_search });
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>idt",  '', { callback = metavars.type_check      });

    vim.api.nvim_buf_set_keymap(
      buffer,
      "n",
      "<leader>idd",
      '',
      {
        callback = function ()
          local name = vim.fn.expand("<cword>")
          repl.evaluate({ expr = ":doc "..name });
        end
      }
    );

    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ide",  '', { callback = repl.evaluate });
    vim.api.nvim_buf_set_keymap(
      buffer,
      "v",
      "<leader>ide",
      '',
      { callback = function () repl.evaluate({ visual = true }) end }
    );
    vim.api.nvim_buf_set_keymap(
      buffer,
      "v",
      "<leader>idr",
      '',
      { callback = function () repl.evaluate({ visual = true, sub = true }) end }
    );
    print("set up idris keymaps");
  end,
}

local status_ok, idris = pcall(require, "idris2")
if not status_ok then
  return
end

idris.setup({
  client = {
    use_split = true,
  },
  server = vim.tbl_extend("force", base_conf, config),
  code_action_post_hook = function(_)
    vim.cmd('silent write')
  end,
})
