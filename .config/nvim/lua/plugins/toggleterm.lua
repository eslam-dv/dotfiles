return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()
    vim.keymap.set("n", "<C-t>", ":ToggleTerm size=10<CR>", { silent = true, noremap = true })
  end,
}
