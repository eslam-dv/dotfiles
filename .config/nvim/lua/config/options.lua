-------------
-- OPTIONS --
-------------
local opt = vim.opt

opt.number = true             -- Line numbers
opt.relativenumber = true     -- Relative line numbers
opt.cursorline = true         -- Cursor line
opt.shiftwidth = 2            -- Set indent to 2
opt.tabstop = 2               -- Set indent to 2
opt.softtabstop = 2           -- Set indent to 2
opt.expandtab = true          -- Use space instead of tab
opt.smartindent = true        -- Detect indentation
opt.smartcase = true          -- Case independent search
opt.ignorecase = true         -- Case independent search 
opt.splitright = true         -- Open new vertical window right
opt.splitbelow = true         -- Open new horizontal window below
opt.wrap = false              -- Disable line wrap
opt.backup = true             -- Remeber changes
opt.scrolloff = 5             -- Show 5 lines upove/under cursor
opt.sidescrolloff = 10        -- Show 10 words right/left cursor
opt.signcolumn = "yes"        -- View signs in number columns
vim.g.background = "dark"     -- Set dark mode as default
opt.clipboard:append({ "unnamedplus" })   -- Use system clipboard
opt.backupdir = "/home/eslam/.local/share/nvim/backup"
