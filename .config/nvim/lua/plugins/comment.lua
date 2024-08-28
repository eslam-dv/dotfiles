return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- enable TS for jsx/tsx
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  opts = {},
}
