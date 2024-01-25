function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return '"'.. tostring(o)..'"'
    end
end

require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.completion"
require "user.lsp"
-- require "user.telescope"
require "user.autopairs"
require "user.treesitter"
require "user.toggleterm"
-- require "user.neotree"
require "user.nnn"
require "user.fzf"
require "user.dap"
-- require "user.firenvim"
require "user.languagetool"
-- vim.cmd [[colorscheme vim]]
vim.cmd [[colorscheme gruvbox]]
