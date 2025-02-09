return {
	"catgoose/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
  opts = {
    filetypes = { "*" }, -- Filetype options.  Accepts table like `user_default_options`
    lazy_load = false, -- Lazily schedule buffer highlighting setup function
    user_default_options = {
      names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
      RGB = true, -- #RGB hex codes
      RGBA = true, -- #RGBA hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS *features*:
      -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
      -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
      tailwind = false, -- Enable tailwind colors
      tailwind_opts = { -- Options for highlighting tailwind names
        update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
      },
      -- parsers can contain values used in `user_default_options`
      sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
      -- Highlighting mode.  'background'|'foreground'|'virtualtext'
      mode = "background", -- Set the display mode
      -- Virtualtext character to use
      virtualtext = "■",
      -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
      virtualtext_inline = false,
      -- Virtualtext highlight mode: 'background'|'foreground'
      virtualtext_mode = "foreground",
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false,
      -- hooks to invert control of colorizer
      hooks = {
        -- called before line parsing.  Set to function that returns a boolean and accepts the following parameters.  See hooks section.
        do_lines_parse = false,
      },
    },
  },
}
