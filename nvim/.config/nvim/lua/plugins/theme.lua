return {
  "navarasu/onedark.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedark").setup({
      style = "deep", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false,
      -- Change code style ---
      code_style = {
        comments = "italic",
        keywords = "italic,bold",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      lualine = {
        transparent = false, -- lualine center bar transparency
      },
    })
    require("onedark").load()
  end,
}
