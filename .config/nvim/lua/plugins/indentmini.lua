return {
  "nvimdev/indentmini.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    char = "│",
    exclude = { "markdown" },
    minlevel = 1,
    only_current = false,
  },
  config = function(_, opts)
    require("indentmini").setup(opts)
    vim.cmd.highlight("IndentLine guifg=#414550")
    vim.cmd.highlight("IndentLineCurrent guifg=#e2e2e3")
  end,
}
