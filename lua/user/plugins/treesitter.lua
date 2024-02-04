return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'HiPhish/rainbow-delimiters.nvim',
    },
    build = ':TSUpdate',
    config = function ()
        -- Tell treesitter where the parsers are
        vim.opt.runtimepath:append("$HOME/.local/share/nvim/treesitter/parsers")
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            parser_install_dir = "$HOME/.local/share/nvim/treesitter/parsers",
            ensure_installed = {
                'c',
				'c_sharp',
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'vim',
				'vimdoc',
				'yaml',
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
