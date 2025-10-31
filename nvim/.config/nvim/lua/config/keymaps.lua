-------------
-- Keymaps --
-------------
-- local map = vim.keymap.set
local function map(mode, keys, action, desc)
	vim.keymap.set(mode, keys, action, { noremap = true, silent = true, desc = desc })
end

-- Set <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank to EOL
map("n", "Y", "y$", "Yank to end of line")

-- Better paste behavior
map("x", "p", '"_dP', "Paste without yanking")

-- Delete without yanking
map({ "n", "v", "x" }, "x", '"_x', "Delete character without yanking")
map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")

-- Remove search highlihgts
map("n", "<leader>h", ":nohl<cr>", "Remove search highlights")

-- Center screen when jumping
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Previous search result (centered)")
map("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half page up (centered)")

-- Buffer navigation
map("n", "L", ":bnext<cr>", "Next buffer")
map("n", "H", ":bprevious<cr>", "Next buffer")
map("n", "Q", ":bdelete!<cr>", "Next buffer")

-- Splitting & resizing
map("n", "<leader>sv", ":vsplit<cr>", "Split window vertically")
map("n", "<leader>sh", ":split<cr>", "Split window horizontally")
map("n", "<leader>sx", ":close<cr>", "Close split window")
map("n", "<C-Up>", ":resize +2<cr>", "Increase window hight")
map("n", "<C-Down>", ":resize -2<cr>", "Decrease window hight")
map("n", "<C-Left>", ":vertical resize -2<cr>", "Decrease window width")
map("n", "<C-Right>", ":vertical resize +2<cr>", "Increase window width")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to bottom window")
map("n", "<C-k>", "<C-w>k", "Move to top window")
map("n", "<C-l>", "<C-w>l", "Move to right window")

-- Terminal
map("t", "<Esc>", "<C-\\><C-N>", "Exit terminal mode")
map("t", "<C-h>", "<C-\\><C-N><C-w>h", "(Terminal) Move to left window")
map("t", "<C-j>", "<C-\\><C-N><C-w>j", "(Terminal) Move to bottom window")
map("t", "<C-k>", "<C-\\><C-N><C-w>k", "(Terminal) Move to up window")
map("t", "<C-l>", "<C-\\><C-N><C-w>l", "(Terminal) Move to right window")

-- Move lines up/down
map("n", "<A-j>", ":m .+1<cr>==", "Move line down")
map("n", "<A-k>", ":m .-2<cr>==", "Move line up")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move selection up")

-- Better indentation in visual mode
map("v", ">", ">gv", "Indent right and reselect")
map("v", "<", "<gv", "Indent left and reselect")

-- File navigation
map("n", "<leader>e", ":Ex<cr>", "Open file explorer")

-- Plugins --
map("n", "<leader>ff", ":Telescope find_files<cr>", "Telescope find files")
map("n", "<leader>fg", ":Telescope live_grep<cr>", "Telescope live grep")
map("n", "<leader>fb", ":Telescope buffers<cr>", "Telescope buffers")
map("n", "<leader>fh", ":Telescope help_tags<cr>", "Telescope help tags")
