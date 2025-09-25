local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-----------------
-- Insert Mode --
-----------------
map("i", "jk", "<esc>", opts)
map("i", "kj", "<esc>", opts)

map("i", "<C-s>", "<esc>:w<cr>", opts)
map("i", "<C-a>", "<esc>ggVG", opts)

-----------------
-- Normal Mode --
-----------------
map("n", "<C-s>", ":w<cr>", opts)
map("n", "<C-a>", "ggVG", opts)

-- Buffer navigation
map("n", "H", ":bnext<cr>", opts)
map("n", "L", ":bprev<cr>", opts)
map("n", "Q", ":bdelete<cr>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Split window
map("n", "<leader>sh", ":split<cr>", opts)
map("n", "<leader>sv", ":vsplit<cr>", opts)
map("n", "<leader>sx", ":close<cr>", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<cr>", opts)
map("n", "<C-Down>", ":resize +2<cr>", opts)
map("n", "<C-Left>", ":vertical resize -2<cr>", opts)
map("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Diagnostic
map("n", "gl", vim.diagnostic.open_float, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)

-----------------
-- Visual Mode --
-----------------
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
