-------------
-- KEYMAPS --
-------------
local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local term_opts = { silent = true }
vim.g.mapleader = " " -- Set Space as leader

-- Navigate panes better
map("n", "<C-j>", ":wincmd j<cr>", opts)
map("n", "<C-k>", ":wincmd k<cr>", opts)
map("n", "<C-h>", ":wincmd h<cr>", opts)
map("n", "<C-l>", ":wincmd l<cr>", opts)

map("n", "<leader>h", ":nohl<cr>", opts)        -- Remove highlighting
map({ "n", "i" }, "<C-s>", "<esc>:w<cr>", opts) -- Save file with Ctrl + s
map({ "n", "i" }, "<C-a>", "ggVG", opts)        -- Select all with Ctrl + a

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

-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

map("v", "p", '"_dP', opts) -- Better paste

-- Diagnostics
map("n", "gl", ":lua vim.diagnostic.open.float()<cr>", opts)
map("n", "[d", ":lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
map("n", "]d", ":lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)


-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
