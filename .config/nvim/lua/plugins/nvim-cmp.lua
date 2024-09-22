return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  event = { "InsertEnter" },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp_kinds = {
      Text = "󰉿 ",
      Method = "󰆧 ",
      Function = "󰊕 ",
      Constructor = " ",
      Field = " ",
      Variable = "󰀫 ",
      Class = "󰠱 ",
      Interface = " ",
      Module = " ",
      Property = "󰜢 ",
      Unit = "󰑭 ",
      Value = "󰎠 ",
      Enum = " ",
      Keyword = "󰌋 ",
      Snippet = " ",
      Color = "󰏘 ",
      File = "󰈙 ",
      Reference = " ",
      Folder = "󰉋 ",
      EnumMember = " ",
      Constant = "󰏿 ",
      Struct = " ",
      Event = " ",
      Operator = "󰆕 ",
      TypeParameter = " ",
      Misc = " ",
      Codeium = " ",
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
          return vim_item
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
