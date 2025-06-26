local csharpier_running = nil
local csharpier_port = 49152

local function buffer_content(bufnr)
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    return table.concat(content, "\n")
end

local function handle_output(bufnr, out)
    if out.code ~= 0 then
        vim.api.nvim_err_writeln(out.stderr)
        return;
    end

    local response = vim.json.decode(out.stdout)

    if response.errorMessage ~= vim.NIL then
        print(response.errorMessage)
        return;
    end

    vim.api.nvim_buf_set_lines(
        bufnr,
        0, -1,
        false,
        vim.split(response.formattedFile, "\n", { trimempty = true })
    )
end

local function format_buffer(bufnr, port, timeout)
    local request = {
        fileName = vim.api.nvim_buf_get_name(bufnr),
        fileContents = buffer_content(bufnr),
    }

    local handle = vim.system(
        {
            'curl',
            '--silent',
            '-X', 'POST',
            '-H', 'Content-Type:application/json',
            '--data', vim.json.encode(request),
            'http://localhost:' .. tostring(port) .. '/format',
        },
        {
            timeout = timeout,
            text = true,
        }
    )

    handle_output(bufnr, handle:wait(timeout))
end

local function csharpier_path()
    if vim.fn.executable('dotnet-csharpier') then
        return 'dotnet-csharpier'
    end

    local mr_found, mr = pcall(require, 'mason-registry');
    if not mr_found then
        return nil
    end

    local csp_found, csp = pcall(mr.get_package, 'csharpier')
    if not csp_found then
        return nil
    end

    local path = csp:get_install_path()
    if vim.fn.executable(path) then
        return path
    end

    return nil
end

local function start_csharpier(path, port)
    local success, out = pcall(
        vim.system,
        {
            path,
            '--server',
            '--server-port',
            tostring(port),
        },
        {},
        function(obj)
            csharpier_running = nil
        end
    )

    csharpier_running = success
end

local function configure_format(bufnr)
    local usrcmd = vim.api.nvim_buf_create_user_command
    local function fmt(timeout)
        return function()
            format_buffer(bufnr, csharpier_port, timeout)
        end
    end
    usrcmd(bufnr, "FormatQuick", fmt(1000), {})
    usrcmd(bufnr, "Format", fmt(30000), {})
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = "UsrLspConfig",
        command = "FormatQuick",
        buffer = bufnr,
    })
end

local function configure_csharpier(bufnr)
    local path = csharpier_path()

    if path == nil then return end

    if csharpier_running == nil then
        start_csharpier(path, csharpier_port)
    end

    if not csharpier_running then return end

    configure_format(bufnr)
end


return {
    on_attach = function(client, bufnr)
        local lsp = vim.lsp.buf;
        local opts = { noremap = true, silent = true }
        local usrcmd = vim.api.nvim_buf_create_user_command
        local keymap = vim.api.nvim_buf_set_keymap

        usrcmd(bufnr, "Rename", function() lsp.rename() end, {})
        keymap(bufnr, "n", "<leader>rn", "<cmd>Rename<CR>", opts)

        usrcmd(bufnr, "SignatureHelp", lsp.signature_help, {})
        keymap(bufnr, "n", "<C-k>", "<cmd>SignatureHelp<CR>", opts)

        keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        configure_csharpier(bufnr)
    end,
}
