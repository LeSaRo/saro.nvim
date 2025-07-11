return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'HiPhish/rainbow-delimiters.nvim',
    },
    branch = 'master',
    lazy = 'false',
    build = ':TSUpdate',

    config = function ()
        -- Tell treesitter where the parsers are
        vim.opt.runtimepath:append("$HOME/.local/share/nvim/treesitter/parsers")
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            parser_install_dir = "$HOME/.local/share/nvim/treesitter/parsers",
            ensure_installed = {
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
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },
        })
    end,
}
