local options = {
  backup = false,
  writebackup = true,
  belloff = "",           --always ring bell (for practicing purposes)
  errorbells = true,
  -- browsedir = "last",  --Deprecated?
  clipboard = "unnamedplus",
  cmdheight = 2,
  cursorline = true,
  splitright = true,
  splitbelow = false,
  equalalways = true,      --Make all windows the same size. Under consideration for being turned off
  termguicolors = true,
  langmenu = "none",
  listchars = "tab:> ,trail:-,nbsp:+,leadmultispace:\\u23B8   ",
  list = true,
  number = true,
  relativenumber = false,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  ruler = true,
  scrolloff = 5,
  sidescrolloff = 7,
  showbreak = "-> ",
  showmode = false,
  smartindent = true,
  smarttab = true,
  wildmode = "longest:full,full",
  exrc = true,
  secure = true,
  foldlevel = 3,
  spelllang = 'en_gb,en_us,nl',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.airline_theme='base16_gruvbox_dark_hard'
vim.g.airline_powerline_fonts=1
vim.g["airline#extensions#tabline#enabled"]=1
vim.g.gutentags_generate_on_new=0
vim.g.gutentags_generate_on_write=0
vim.g.gutentags_generate_on_missing=0

vim.cmd [[set exrc]]
vim.cmd [[set diffopt+=horizontal]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set matchpairs+=<:>]]
