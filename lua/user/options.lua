local options = {
        backup = false,
        writebackup = true,
        belloff = "",           --always ring bell (for practicing purposes)
        errorbells = true,
        browsedir = "last",
        smartindent = true,
        clipboard = "unnamedplus",
        cmdheight = 2,
        cursorline = true,
        splitright = true,
        splitbelow = false,
        equalalways = true,      --Make all windows the same size. Under consideration for being turned off
        termguicolors = true,
        langmenu = "none",
        listchars = "tab:> ,trail:-,nbsp:+",
        list = true,
        number = true,
        relativenumber = true,
        expandtab = true,
        shiftwidth = 2,
        tabstop = 4,
        ruler = true,
        scrolloff = 5,
        sidescrolloff = 7,
        showbreak = "-> ",
        smartindent = true,
        smarttab = true,
        wildmode = "longest:full,full",
}

for k, v in pairs(options) do
        vim.opt[k] = v
end

vim.cmd [[syntax enable]]
vim.cmd [[set diffopt+=horizontal]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set matchpairs+=<:>]]
