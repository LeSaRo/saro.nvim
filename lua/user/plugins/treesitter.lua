return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'HiPhish/rainbow-delimiters.nvim',
    },
    branch = 'main',
    lazy = 'false',
    build = ':TSUpdate',

    config = function ()
        -- Tell treesitter where the parsers are
        vim.opt.runtimepath:append("$HOME/.local/share/nvim/treesitter/parsers")

        opts = {
            parser_install_dir = "$HOME/.local/share/nvim/treesitter/parsers",
            sync_install = false,
        }
    end,

    init = function ()
        local ensure_installed = { 
            'c',
            'lua',
            'python',

            'csv',
            'ini',
            'json',
            'yaml',

            'make',
            'vim',
            'vimdoc',

            'markdown',
            'markdown_inline',
            'latex',

            'html',
            'css',
            'javascript',
        }

        local alreadyInstalled = require('nvim-treesitter.config').get_installed()
        local parsersToInstall = vim.iter(ensure_installed)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require('nvim-treesitter').install(parsersToInstall)

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
