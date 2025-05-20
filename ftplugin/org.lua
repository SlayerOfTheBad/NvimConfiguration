vim.api.nvim_create_autocmd("BufWritePre", {
    group = "UsrLspConfig",
    callback = function(_)
        local cursor = vim.fn.getcurpos();
        vim.cmd [[silent! gg=G]]
        vim.fn.setpos('.', cursor)
    end,
    buffer = vim.api.nvim_get_current_buf(),
})

vim.wo.conceallevel = 2
vim.wo.concealcursor = 'cn'
vim.wo.wrap = false
