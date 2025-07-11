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

-- Resize with arrows (makes sense for the window on the bottom right)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Toggle line wrap
opts.desc = "Toggle line wrap"
keymap("n", "<leader>uw", "<cmd>WrapToggle<CR>", opts)

-- Tabs --
opts.desc = "New tab"
keymap("n", "<leader>tn", "<cmd>tabnew<CR>", opts)
opts.desc = "Close tab"
keymap("n", "<leader>tc", "<cmd>tabc<CR>", opts)

-- Split --
opts.desc = "Split verticaly"
keymap("n", "<leader>sk", "<cmd>vsplit<CR>", opts)
opts.desc = "Split horizontaly"
keymap("n", "<leader>sl", "<cmd>split<CR>", opts)

-- Search --
opts.desc = "Clear search"
keymap("n", "<leader>n", "<cmd>nohlsearch<CR>", opts)

-- Actions --
-- File
opts.desc = "Set file as executable"
keymap("n", "<leader>afx", "<cmd>!chmod +x %<CR>", opts)

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

-- barbar --
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- navigate buffers
keymap('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Buffer pickers
keymap('n', '<A-p>',   '<Cmd>BufferPick<CR>', opts)
keymap('n', '<A-s-p>', '<Cmd>BufferPickDelete<CR>', opts)
-- Sort automatically by...
opts.desc = "Order by number"
keymap('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
opts.desc = "Order by name"
keymap('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', opts)

-- colorscheme --
opts.desc = "Toggle transparency"
keymap("n", "<leader>ut", "<cmd>CSTrans<CR>", opts)
-- nvim-tree --
opts.desc = "Toggle file explorer"
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts) -- toggle file explorer

-- lazy --
opts.desc = "Open lazy.nvim menu" keymap("n", "<leader>pl", "<cmd>Lazy<CR>", opts)

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
opts.desc = "Open Mason menu"
keymap("n", "<leader>pm", "<cmd>Mason<CR>", opts)
-- Defined in lsp/handlers.lua --
--[[
<gl> Show diagnostic
<gd> Goto word definition (where has it been made)
<gD> Goto word declaration (where is it called)
<K> Show word description
<gr> Show list of refereces
<L-g> Show list of diagnostics
--]]
opts.desc = "Show word declaration [LSP]"
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
opts.desc = "Show word definition [LSP]"
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
opts.desc = "Show word description [LSP]"
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
opts.desc = "Show word implementation [LSP]"
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
opts.desc = "Show list of word references [LSP]"
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
opts.desc = "Show diagnostic [LSP]"
keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
opts.desc = "Show list of diagnostics [LSP]"
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- dap --
--[[ opts.desc = "Toggle debugger"
keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", opts)
opts.desc = "Toggle breakpoint"
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
opts.desc = "Debug program"
keymap("n", "<leader>dd", "<cmd>DapContinue<CR>", opts) ]]

-- telescope --
-- keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
opts.desc = "Find file"
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
opts.desc = "Find word (grep)"
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
opts.desc = "Find media"
keymap("n", "<leader>fm", "<cmd>Telescope media_files<cr>", opts)


-- markdown-preview --
opts.desc = "Toggle Preview"
keymap("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", opts)
opts.desc = "Toggle Rendering"
keymap("n", "<leader>mr", "<cmd>RenderMarkdown set<CR>", opts)

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
keymap("n", "<leader>un", "<cmd>Noice dismiss<CR>", opts)

-- icon-picker --
opts.desc = "Insert icon (insert)"
vim.keymap.set("n", "<Leader>ii", "<cmd>IconPickerInsert<cr>", opts)
opts.desc = "Insert icon (normal)"
vim.keymap.set("n", "<Leader>in", "<cmd>IconPickerNormal<cr>", opts)
opts.desc = "Yank icon"
vim.keymap.set("n", "<Leader>iy", "<cmd>IconPickerYank<cr>", opts) -- Yank the selected icon into register
vim.keymap.set("i", "<C-$>", "<cmd>IconPickerInsert<cr>", opts)
-- todo-comments --
opts.desc = "Find"
vim.keymap.set("n", "<Leader>cf", "<cmd>TodoTelescope<cr>", opts)
opts.desc = "List"
vim.keymap.set("n", "<Leader>cl", "<cmd>TodoTrouble<cr>", opts)
-- inserts --
opts.desc = "Fix"
vim.keymap.set("n", "<Leader>cif", "aFIX: ", opts)
opts.desc = "Hack"
vim.keymap.set("n", "<Leader>cih", "aHACK: ", opts)
opts.desc = "Note"
vim.keymap.set("n", "<Leader>cin", "aNOTE: ", opts)
opts.desc = "Perf"
vim.keymap.set("n", "<Leader>cip", "aPERF: ", opts)
opts.desc = "Todo"
vim.keymap.set("n", "<Leader>cit", "aTODO: ", opts)
opts.desc = "Warning"
vim.keymap.set("n", "<Leader>ciw", "aWARNING: ", opts)
