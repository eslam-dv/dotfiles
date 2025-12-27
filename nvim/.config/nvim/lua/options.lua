local opt = vim.opt

-- Editor
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.clipboard:append("unnamedplus")
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 5
opt.wrap = false
opt.ignorecase = true
opt.undofile = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Folding
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
opt.foldlevel = 99
opt.foldtext = ""
