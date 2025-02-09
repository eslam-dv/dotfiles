local map = function(mode, keys, cmd, desc)
	vim.keymap.set(mode, keys, cmd, { silent = true, noremap = true, desc = desc })
end

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-s>", ":w<CR>", "save file with Ctrl + s")
map("n", "<C-a>", "ggVG", "select all with Ctrl + a")

-- Better paste
map("v", "p", '"_dP', "Better Paste")

-- Remove search highlihgt
map("n", "<leader>h", ":nohl<CR>", "remove search highlight")

-- Press jk fast to exit insert mode
map("i", "jk", "<ESC>", "exit insert mode")
map("i", "kj", "<ESC>", "exit insert mode")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "focus left window")
map("n", "<C-j>", "<C-w>j", "focus bottom window")
map("n", "<C-k>", "<C-w>k", "focus top window")
map("n", "<C-l>", "<C-w>l", "focus right window")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", "resize window up")
map("n", "<C-Down>", ":resize +2<CR>", "resize window down")
map("n", "<C-Left>", ":vertical resize -2<CR>", "resize window left")
map("n", "<C-Right>", ":vertical resize +2<CR>", "resize window right")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", "go to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "go to previous buffer")
map("n", "<S-q>", ":bdelete<CR>", "close buffer")

-- Move text up and down
map("n", "<A-j>", ":m .+1<CR>==", "move line down")
map("n", "<A-k>", ":m .-2<CR>==", "move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "move line down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "move line up")

-- Stay in indent mode
map("v", "<", "<gv^", "de-indent line")
map("v", ">", ">gv^", "indent line")

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })

-- Diagnostics
map("n", "gl", "lua <CR>", "Open diagnostic float")
map("n", "[d", "lua <CR>", "Jump to previous diagnostic")
map("n", "]d", "lua <CR>", "Jump to next diagnostic")

-- Plugins
-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", "toggle file tree")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", "find files")
map("n", "<leader>fs", ":Telescope live_grep<CR>", "find string")
map("n", "<leader>fg", ":Telescope grep_string<CR>", "find string under cursor")
