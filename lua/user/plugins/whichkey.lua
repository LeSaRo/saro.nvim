return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function ()
        require("which-key").add({
            { "<leader>a", group = "action" },
            { "<leader>af", desc = "file" },
            { "<leader>b", group = "buffers" },
            { "<leader>c", group = "comments" },
            { "<leader>ci", desc = "insert" },
            { "<leader>d", group = "debug" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>i", group = "icon" },
            { "<leader>p", group = "plugins" },
            { "<leader>s", group = "split" },
            { "<leader>t", group = "tabs" },
            { "<leader>u", group = "ui" },
        }, { prefix = "<leader>" })
        --wk.register({ i = "insert"}, {prefix = "<leader>c" })
        --wk.register({ i = "icon"}, {prefix = "<leader>i" })
        --wk.register({ f = "file"}, {prefix = "<leader>a" })
        return {
            win = {
                border = "single"
            }
        }
    end
}
