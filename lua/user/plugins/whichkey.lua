return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
        local wk = require("which-key")
        wk.register({
            b = { name = "buffers" },
            c = { name = "comments" },
            d = { name = "debug" },
            f = { name = "find" },
            g = { name = "git" },
            i = { name = "icon" },
            p = { name = "plugins" },
            s = { name = "split" },
            t = { name = "tabs" },
            u = { name = "ui" },
        }, { prefix = "<leader>" })
        wk.register({ i = "insert"}, {prefix = "<leader>c" })
        wk.register({ i = "icon"}, {prefix = "<leader>i" })
        wk.setup({
            window = {
                border = "single"
            }
        })
    end
}
