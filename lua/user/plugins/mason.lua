    local lsp_servers = {
    "lua_ls",
	"pyright",
    "marksman",
}

return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- code
            local lspconfig = require("lspconfig")
            local opts = {}

            for _, server in pairs(lsp_servers) do
                opts = {
                    on_attach = require("user.lsp.handlers").on_attach,
                    capabilities = require("user.lsp.handlers").capabilities,
                }

                server = vim.split(server, "@")[1]

                local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
                if require_ok then
                    opts = vim.tbl_deep_extend("force", conf_opts, opts)
                end

                lspconfig[server].setup(opts)
            end
        end
    },
    -- mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            ui = {
                border = "none",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 4,
        },
    },
    -- mason-lspconfig
    {
        "williamboman/mason-lspconfig",
        opts = {
            ensure_installed = lsp_servers,
            automatic_installation = true,
        },
    },
}
