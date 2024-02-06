local nnn = require('nnn')

nnn.setup({
  explorer = {
    cmd = "nnn -G"
  },
  picker = {
    cmd = "nnn -G",
    style = {
      border = "rounded",
      width = 24,
      height = 0.9,
      xoffset = 0.99,
      yoffset = -1,
    }
  },
  windownav = {
    left = "<M-h>",
    right = "<M-l>",
    next = "<M-w>",
    prev = "<M-W>",
  },
  mappings = {
    -- { "<Esc>", function() require("nnn").toggle("explorer") end },
    -- { "\\", function() require("nnn").toggle("explorer") end },
    { "s", nnn.builtin.open_in_vsplit },
    { "S", nnn.builtin.open_in_split },
  }
})

