local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeout = true,
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                  -- set relative numbered lines
    numberwidth = 2,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = true,                            -- wrap lines around the screen
    linebreak = true,                       -- wrap around words instead of characters
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    colorcolumn = "80",
    showcmd = true,
}

vim.opt.shortmess:append "cfilmnr"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd("set iskeyword+=-") -- Don't see the need to count - as part of a word
vim.cmd("set formatoptions-=cro") -- TODO: this doesn't seem to work

-- Set colorscheme transparency on the fly
vim.g["cstrans"] = false
vim.api.nvim_create_user_command(
    'CSTrans',
    function()
        if vim.g["cstrans"] then
            vim.g["cstrans"] = false
        else
            vim.g["cstrans"] = true
        end
        vim.cmd("Lazy reload tokyonight.nvim")
        vim.cmd("Noice dismiss")
    end,
    {}
)

-- Toggle line wrap
vim.api.nvim_create_user_command(
    'WrapToggle',
    function()
        if vim.opt["wrap"]:get() then
            vim.opt["wrap"] = false
        else
            print("wrap")
            vim.opt["wrap"] = true
        end
    end,
    {}
)
