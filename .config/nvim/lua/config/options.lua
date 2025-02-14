local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.wrap = false
opt.scrolloff = 5
opt.sidescrolloff = 10
opt.splitright = true
opt.splitbelow = true
opt.smartcase = true
opt.smartindent = true
opt.termguicolors = true
opt.undofile = true
opt.ignorecase = true
opt.showmode = false
opt.timeoutlen = 1000
opt.updatetime = 1000
opt.signcolumn = "yes"
opt.clipboard:append({ "unnamedplus" })
opt.completeopt = { "menuone", "noselect" }
opt.mouse = "a"
opt.syntax = "yes"
