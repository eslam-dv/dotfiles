return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "css", "go" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
