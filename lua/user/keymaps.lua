local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Split --
opts.desc = "Split verticaly"
keymap("n", "<leader>|", "<cmd>vsplit<CR>", opts)
opts.desc = "Split horizontaly"
keymap("n", "<leader>-", "<cmd>hsplit<CR>", opts)

-- Search --
opts.desc = "Clear search"
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Buffers --
opts.desc = "Delete buffer"
keymap("n", "<leader>bd", "<cmd>bd<CR>", opts)

-- Insert --
-- Mash jk to exit
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

----------------
-- Extentions --
----------------
-- nvim-tree --
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

-- lazy --
keymap("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Open lazy.nvim menu" })

-- cmp --
-- Defined in the config file
--[[
<C-k> <Tab> Next item
<C-j> <S-Tab> Prev item
<C-b> Next page
<C-f> Prev page
<C-Space> Pull-up the menu
<C-e> Close menu
<CR> Confirm
--]]

-- lsp --
keymap("n", "<leader>pm", "<cmd>Mason<CR>", { desc = "Open Mason menu" })
-- Defined in lsp/handlers.lua --
--[[
<gl> Show diagnostic
<gd> Goto word definition (where has it been made)
<gD> Goto word declaration (where is it called)
<K> Show word description
<gr> Show list of refereces
<L-g> Show list of diagnostics
--]]

-- telescope --
-- keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
opts.desc = "Find file"
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
opts.desc = "Find word (grep)"
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
opts.desc = "Find media"
keymap("n", "<leader>fm", "<cmd>Telescope media_files<cr>", opts)


-- markdown-preview --
keymap("n", "<leader>M", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

-- Comments --
--[[
<gcc>(n) Comment line
<gc>(v) Comment line(s)
--]]

-- gitsigns --
opts.desc = "Blame line"
keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
opts.desc = "Previwe hunk"
keymap("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", opts)
opts.desc = "Toggle deleted lines"
keymap("n", "<leader>gr", "<cmd>Gitsigns toggle_deleted<CR>", opts)
opts.desc = "Diff hunk"
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", opts)

-- noice --
opts.desc = "Dissmis notifications"
keymap("n", "<leader>n", "<cmd>Noice dismiss<CR>", opts)
