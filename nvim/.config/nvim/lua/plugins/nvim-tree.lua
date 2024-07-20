return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
      },
    })
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
  end
}
