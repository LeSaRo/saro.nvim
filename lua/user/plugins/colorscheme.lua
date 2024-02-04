return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "moon",
            transparent = true,
            styles = {
                sidebars = "dark",
                floats = "dark"
            }
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
