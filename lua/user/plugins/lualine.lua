return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            --[[ component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''}, ]]
            component_separators = { left = '▏', right = '▕'},
            section_separators = { left = '█', right = '█'},
            disabled_filetypes = {
                'NvimTree',
            },
        },
        sections =  {
            lualine_x = { 'filetype' },
        }
    },
}
