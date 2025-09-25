local opt = vim.opt

opt.clipboard:append("unnamedplus")
opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a"

-- Tab
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smarttab = true
opt.expandtab = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- UI config
opt.cursorline = true
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"

-- Windows splitting
opt.splitbelow = true
opt.splitright = true

-- Searching
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Save undo history
opt.undofile = true

-- Border for all floating windows
opt.winborder = "rounded"
