return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "windwp/nvim-ts-autotag" },
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    local autotag = require('nvim-ts-autotag')

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

    autotag.setup({
      opts = {
        -- Defaults
        enable_close = true,        -- Auto close tags
        enable_rename = true,       -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      }
    })
  end,
}
