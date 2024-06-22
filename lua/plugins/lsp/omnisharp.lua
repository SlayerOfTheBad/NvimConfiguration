local csharpier_running = nil
local csharpier_port = 49152

local buffer_content = function(bufnr)
    local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    return table.concat(content, "\n")
end

local handle_output = function(bufnr, out)
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

local format_buffer = function(bufnr, port, timeout)
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

    handle_output(bufnr, handle.wait(handle, timeout))
end

local csharpier_path = function()
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

local start_csharpier = function(path, port)
    local success, _ = pcall(
        vim.system,
        {
            path,
            '--server',
            '--server-port',
            tostring(port),
        },
        {},
        function() csharpier_running = nil end
    )

    csharpier_running = success
end

local configure_format = function(bufnr)
    local usrcmd = vim.api.nvim_buf_create_user_command
    local fmt = function(timeout)
        return function()
            format_buffer(bufnr, csharpier_port, timeout)
        end
    end
    usrcmd(
        bufnr,
        "FormatQuick",
        fmt(1000),
        {}
    )
    usrcmd(
        bufnr,
        "Format",
        fmt(30000),
        {}
    )
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = "UsrLspConfig",
        command = "FormatQuick",
        buffer = bufnr,
    })
end

local configure_csharpier = function(bufnr)
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
        configure_csharpier(bufnr)
    end,
}
