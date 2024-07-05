return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      pre_hook = function()
        return vim.bo.commentstring
      end,
    })
  end,
}
