-- Shorten function name
local keymap = vim.keymap.set
local term_opts = { silent = true }

local function map(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<S-q>", ":bdelete!<CR>") -- close buffer

-- Move text up and down
-- map("n", "<A-j>", ":m .+1<CR>==")
-- map("n", "<A-k>", ":m .-2<CR>==")

-- Clear search highlights
map("n", "<leader>h", ":nohl<CR>")

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>") -- increment
map("n", "<leader>-", "<C-x>") -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v") -- split window vertically
map("n", "<leader>sh", "<C-w>s") -- split window horizontally
map("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

-- Normal save and select all
map("n", "<C-a>", "ggVG") -- Ctrl + a to select all
map("n", "<C-s>", ":w!<cr>") -- Ctrl + s to save

-- Diagnostic
map("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>")
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>")

-- Insert --
-- Press jk fast to exit insert mode 
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Visual --
-- Stay in indent mode
map("v", ">", ">gv^")
map("v", "<", "<gv^")

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":m '>+1<CR>gv=gv")
map("x", "K", ":m '<-2<CR>gv=gv")
-- map("x", "<A-j>", ":m '>+1<CR>gv=gv")
-- map("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugins --
-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fs", ":Telescope grep_string<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
