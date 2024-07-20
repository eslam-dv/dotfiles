-- Change leader to space
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-----------------------------------------------------------
-- Input
-----------------------------------------------------------
-- esc with jk, kj
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)

-- Normal --
-- remove highlight
map("n", "<leader>h", ":nohl<CR>", opts)

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- save and quit
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":qa!<CR>", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-q>", ":bdelete!<CR>", opts)

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-----------------------------------------------------------
-- Visual
-----------------------------------------------------------
-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "p", '"_dP', opts)

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
