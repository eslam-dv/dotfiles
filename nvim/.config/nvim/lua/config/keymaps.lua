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
map("n", "<leader>h", ":nohl<cr>", opts)

-- Buffer navigation
map("n", "L", ":bnext<cr>", opts)
map("n", "H", ":bprev<cr>", opts)
map("n", "Q", ":bdelete!<cr>", opts)

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

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Diagnostic
map("n", "gl", vim.diagnostic.open_float, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)

-----------------
-- Visual Mode --
-----------------
-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Better Paste
map("v", "p", '"_dP', opts)

-----------------
-- Terminal Mode --
-----------------
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("t", "jk", "<C-\\><C-n>", opts)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
