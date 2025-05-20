local registry = require("mason-registry")
local pylsp, err = registry.get_package("python-lsp-server")

if err ~= nil or not pylsp:is_installed() then
    return {}
end

vim.system({
    pylsp:get_install_path() .. "/venv/bin/python",
    "-m",
    "pip",
    "install",
    "pylsp-mypy",
    "python-lsp-ruff",
    "python-lsp-server[pylint]",
})

return {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = false,
                },
                pylsp_mypy = {
                    dmypy = true,
                },
                pylint = {
                    enabled = true,
                }
            },
        },
    }
}
