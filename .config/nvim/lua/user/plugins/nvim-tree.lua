return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = 25,
      side = "right",
    },
    renderer = {
      indent_markers = { enable = true }
    },
    filters = {
      git_ignored = false,
      dotfiles = false,
    }
  }
}
