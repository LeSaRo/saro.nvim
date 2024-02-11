return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = vim.g["cstrans"],
            styles = {
                sidebars = "dark",
                floats = "dark"
            },

            on_highlights = function(hl, colors)
                --[[hl.ColorColumn = {
                    bg = "#50557f"
                }--]]
                hl.GitSignsAdd = {
                    fg = "green"
                }
                hl.GitSignsChange = {
                    fg = "darkblue"
                }
                hl.GitSignsDelete = {
                    fg = "red"
                }
            end
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
