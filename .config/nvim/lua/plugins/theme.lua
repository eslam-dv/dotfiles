return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.sonokia_style = "andromeda"
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_transparent_background = 0
    vim.cmd.colorscheme("sonokai")
  end,
}
