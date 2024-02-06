return {
    "ziontee113/icon-picker.nvim",
    dependencies = {
        "stevearc/dressing.nvim",
    },
    opts = {
        disable_legacy_commands = true,
    },
    config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })

        local opts = { noremap = true, silent = true }

    end
}
