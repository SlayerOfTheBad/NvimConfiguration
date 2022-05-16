local options = {
	backup = false,
	writebackup = true,
	belloff = "", 		--always ring bell (for practicing purposes)
	browsedir = "last",
	smartindent = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
