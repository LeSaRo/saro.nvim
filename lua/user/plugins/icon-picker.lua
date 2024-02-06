return {
    "ziontee113/icon-picker.nvim",
    dependencies = {
        "stevearc/dressing.nvim",
    },
    config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })

        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "<Leader>ii", "<cmd>IconPickerInsert<cr>", opts)
        vim.keymap.set("n", "<Leader>in", "<cmd>IconPickerNormal<cr>", opts)
        vim.keymap.set("n", "<Leader>iy", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
        vim.keymap.set("i", "<C-$>", "<cmd>IconPickerInsert<cr>", opts)
    end
}
