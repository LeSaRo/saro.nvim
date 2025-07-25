return{
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = function()
        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        return {
            diagnostics = {
                enable = true,
                icons = {
                    hint = "󰌵",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
            view = {
                side = "right",
                width = 30,
                relativenumber = false,
            },
            renderer = {
                icons = { glyphs = {
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        deleted = "",
                        untracked = "U",
                        ignored = "◌",
                    },
                },},
            },
            actions = { open_file = {
                quit_on_open = true,
                window_picker = { enable = false, },
            },},
            filters = {
                custom = { ".DS_Store" },
            },
        }
    end,
}
