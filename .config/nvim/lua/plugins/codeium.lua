return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, expr = true }

    vim.g.codeium_disable_bindings = 1

    map("i", "<C-f>", function() return vim.fn["codeium#Accept"]() end, opts)
    map("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, opts)
    map("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-2) end, opts)
    map("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, opts)
    map("n", "<leader>c", ":CodeiumToggle<CR>", opts)
  end,
}
