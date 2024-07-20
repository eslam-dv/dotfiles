return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
          },
        },
      },
    })

    map("n", "<leader>ff", builtin.find_files, opts)
    map("n", "<leader>fg", builtin.grep_string, opts)
  end,
}
