-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})
