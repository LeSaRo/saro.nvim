return {
    "folke/tokyonight.nvim",
    opts = function ()
        return {
            style = "night",
            transparent = vim.g["cstrans"],
            styles = {
                sidebars = "dark",
                floats = "dark"
            },

            on_highlights = function(hl, colors)
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
        }
    end,
}
