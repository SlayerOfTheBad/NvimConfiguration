local options = {
	backup = false,
	writebackup = true,
	belloff = "", 		--always ring bell (for practicing purposes)
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
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd [[set diffopt+=horizontal]]
vim.cmd [[set iskeyword+=-]]
