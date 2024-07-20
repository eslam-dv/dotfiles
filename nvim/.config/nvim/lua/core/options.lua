local opt = vim.opt
local g = vim.g

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.completeopt = "menuone,noinsert,noselect"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.foldmethod = "marker"
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true
opt.wrap = false
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8


-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.timeoutlen = 300
opt.updatetime = 300

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
