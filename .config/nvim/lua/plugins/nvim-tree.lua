return {
  "nvim-tree/nvim-tree.lua",
  config = function()

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = true
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
    })
  end
}
