return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      mappings = {
        i = {
          ["<C-k>"] = move_selection_previous,
          ["<C-j>"] = move_selection_next,
        },
      },
    },
  },
}
