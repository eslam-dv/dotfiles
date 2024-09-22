return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local map = vim.keymap.set
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
        map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
        map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
        map("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
        map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
        map("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
        map("n", "<leader>lf", ":lua vim.lsp.buf.format{ async = true }<cr>", opts)
        map("n", "<leader>li", ":LspInfo<cr>", opts)
        map("n", "<leader>lI", ":LspInstallInfo<cr>", opts)
        map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<cr>", opts)
        map("n", "[d", ":lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
        map("n", "]d", ":lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
        map("n", "<leader>lr", ":lua vim.lsp.buf.rename()<cr>", opts)
        map("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
        map("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
      end,
    })

    local config = {
      virtual_text = true,
      signs = {
        active = signs,
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "solid",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    require("mason-lspconfig").setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
