-- Settings https://github.com/windwp/nvim-autopairs
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return;
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},
    javascript = {'template_string'},
  },
  disable_filetype = {
    "TelescopePromts",
  },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'"  },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'asdfjkl;',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  }
})

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return;
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
