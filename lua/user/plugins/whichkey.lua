return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function ()
        local wk = require("which-key")
        wk.register({
            b = { name = "buffers" },
            f = { name = "find" },
            g = { name = "git" },
            p = { name = "plugins" },
        }, { prefix = "<leader>" })
    end
}
