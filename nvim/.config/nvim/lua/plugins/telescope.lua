vim.pack.add({ { src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("0.1.x") } })

require("telescope").setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
})
