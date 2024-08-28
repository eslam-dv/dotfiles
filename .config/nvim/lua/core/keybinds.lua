local map = vim.keymap.set
local opts = { silent = true, noremap = true}
local term_opts = { silent = true }

-- make <Space> the <leader> key
vim.g.mapleader = " "

map("i", "jk", "<Esc>", opts)

map("v", "p", '"_dP', opts) -- better paste
map("n", "<leader>h", ":nohl<CR>", opts) -- remove highlight

-- Ctrl + s to save
map("i", "<C-s>", "<Esc>:w<cr>", opts)
map("n", "<C-s>", ":w<CR>", opts)

-- Ctrl + a to select all
map("i", "<C-a>", "<Esc>ggVG", opts)
map("n", "<C-a>", "ggVG", opts)

-- move lines up & down
map("i", "<A-j>", "<Esc>:m+<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m-2<CR>==gi", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- switch buffers
map("n", "L", ":bnext<CR>", opts)
map("n", "H", ":bprevious<CR>", opts)
map("n", "Q", ":bdelete<CR>", opts)

-- manage splits
map("n", "-", ":split<CR>", opts)
map("n", "|", ":vsplit<CR>", opts)
map("n", "X", ":close<CR>", opts)

-- move between splits
map("n", "<C-h>", ":winc h<CR>", opts)
map("n", "<C-j>", ":winc j<CR>", opts)
map("n", "<C-k>", ":winc k<CR>", opts)
map("n", "<C-l>", ":winc l<CR>", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)
map("n", "<", "<<", opts)
map("n", ">", ">>", opts)

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
