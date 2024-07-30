local servers = {
    "lua_ls",
	"pyright",
    "marksman",
}

return {
    -- mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            require("mason").setup({
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
            })
        end,
    },
    -- mason-lspconfig
    {
        "williamboman/mason-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true,
            })
        end,
    },
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- code
            local lspconfig = require("lspconfig")
            local opts = {}

            for _, server in pairs(servers) do
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
    -- dap
    {
        "mfussenegger/nvim-dap",
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = "python",
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    },
    -- dapui
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", },
        opts = {},
    },
    -- neodev
    {
        "folke/neodev.nvim",
        opts = {
            library = {
                plugins = { "nvim-dap-ui" },
                types = true,
            },
        },
    }
}
