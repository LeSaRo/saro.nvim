return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
        buffers = {
            scratchPad = {
                -- set to `false` to
                -- disable auto-saving
                enabled = true,
                -- set to `nil` to default 
                -- to current working directory
                location = "~/documents/",
            },
            bo = {
                filetype = "md"
            },
        },
    }
}
