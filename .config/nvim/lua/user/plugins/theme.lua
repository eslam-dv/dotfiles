return {
  "polirritmico/monokai-nightasty.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    dark_style_background = "default", -- default, dark, transparent, #RRGGBB
    light_style_background = "default", -- default, dark, transparent, #RRGGBB
    hl_styles = {
      -- Custom styles for this groups: (See `:help nvim_set_hl`, Parameters, {val} for supported keys)
      comments = { italic = true },
      keywords = { italic = false },
      functions = {},
      variables = {},
      -- Background styles for floating windows and sidebars (panels):
      floats = "default", -- default, dark, transparent
      sidebars = "default", -- default, dark, transparent
    },

    color_headers = false,       -- Enable header colors for each header level (h1, h2, etc.)
    dim_inactive = false,        -- dims inactive windows
    lualine_bold = true,         -- Lualine headers will be bold or regular
    lualine_style = "default",   -- "dark", "light" or "default" (default follows dark/light style)
    markdown_header_marks = false, -- Add headers marks highlights (the `#` character) to Treesitter highlight query
  },
  config = function(_, opts)
    require("monokai-nightasty").setup(opts)
    require("monokai-nightasty").load()
  end,
}
