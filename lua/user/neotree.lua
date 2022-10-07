local status_ok, neotree = pcall(require, 'neo-tree')
if not status_ok then
  return;
end

vim.g.neo_tree_remove_legacy_commands = 1
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

neotree.setup({
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      },
    },
  },
  filesystem = {
    filtered_items = {
      always_show = {
        "/vendor/magement",
        "/vendor/alumio",
        "/vendor/mediact",
      },
    },
    follow_current_file = true,
  },
})
