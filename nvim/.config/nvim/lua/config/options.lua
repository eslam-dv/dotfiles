-------------
-- Optoins --
-------------
local opt = vim.opt
-- Basic settings
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.splitbelow = true
opt.splitright = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Visual settings
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false
opt.cmdheight = 1
opt.completeopt = "menuone,noinsert,noselect"

-- File handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.updatetime = 300
opt.timeoutlen = 500
opt.autoread = true
opt.autowrite = false

-- Behavior settings
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")
opt.path:append("**")
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
