local function map(mode, bind, cmd, desc)
	vim.keymap.set(mode, bind, cmd, { silent = true, noremap = true, desc = desc })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal editros shortcuts
map("n", "<C-s>", ":w!<cr>", "Save file")
map("n", "<C-a>", "ggVG", "Select all")
map("n", "<leader>q", ":q<cr>", "Quit neovim")
map("n", "<leader>o", ":update<cr> :source<cr>", "Select all")

-- Yank to EOL
map("n", "Y", "y$", "Yank to end of line")

-- Better paste behavior
map("x", "p", '"_dP', "Paste without yanking")

-- Delete without yanking
map({ "n", "v", "x" }, "x", '"_x', "Delete character without yanking")
map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")

-- Remove search highlihgts
map("n", "<leader>h", ":nohl<cr>", "Remove search highlights")

-- Buffer navigation
map("n", "L", ":bnext<cr>", "Next buffer")
map("n", "H", ":bprevious<cr>", "Previous buffer")
map("n", "Q", ":bdelete!<cr>", "Close buffer")

-- Tab navigation
map("n", "<leader>tt", ":$tabnew<cr>", "Create new tab")
map("n", "<leader>tn", ":tabnext<cr>", "Next tab")
map("n", "<leader>tp", ":tabprevious<cr>", "Previous tab")
map("n", "<leader>tx", ":tabclose<cr>", "Close tab")
map("n", "<leader>tmp", ":-tabmove<CR>", "Move current tab to previous position")
map("n", "<leader>tmn", ":+tabmove<CR>", "Move current tab to next position")

-- Split management
map("n", "<leader>sv", ":vsplit<cr>", "Split window vertically")
map("n", "<leader>sh", ":split<cr>", "Split window horizontally")
map("n", "<leader>sx", ":close<cr>", "Close split window")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", "Expand window up")
map("n", "<C-Down>", ":resize +2<CR>", "Expand window down")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Expand window left")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Expand window right")

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
map("n", "<leader>e", ":NvimTreeToggle<cr>", "Open file explorer")

-- Diagnostic
map("n", "gl", ":lua vim.diagnostic.open_float()<cr>", "Open diagnostic float")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>", "Search files")
map("n", "<leader>fb", ":Telescope buffers<cr>", "Search buffers")
map("n", "<leader>fh", ":Telescope help_tags<cr>", "Search help")
map("n", "<leader>fg", ":Telescope live_grep<cr>", "Search pattern")

-- Keybinds for codecompanion
map("n", "<leader>cc", ":CodeCompanionChat Toggle<CR>", "Open code companion")

-- Debugger (dap)
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
map("n", "<F6>", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>")
map("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
map("n", "<F8>", "<Cmd>lua require'dap'.step_out()<CR>")
-- map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
map("n", "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
map("n", "<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")
map("n", "<leader>dt", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", "debug nearest test")
