return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "williamboman/mason.nvim", event = "VeryLazy" },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig_defaults = require("lspconfig").util.default_config

		-- Add cmp_nvim_lsp capabilities settings to lspconfig
		-- This should be executed before you configure any language server
		lspconfig_defaults.capabilities =
			vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, cmp_capabilities)

		-- Diagnostic Config --
		local config = {
			virtual_text = false, -- disable virtual text
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Keymaps Config --
		local opts = { silent = true, noremap = true }
		-- Show diagnostic in a floating window
		vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
		-- Move to previous diagnostic
		vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
		-- Move to next diagnostic
		vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Lsp Actions",
			callback = function(e)
				local bufmap = function(mode, lhs, rhs)
					local bufopts = { buffer = e.buf, silent = true }
					vim.keymap.set(mode, lhs, rhs, bufopts)
				end
				-- Display hover information about the symbol under cursor
				bufmap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
				-- Go to definition
				bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
				-- Go to declaration
				bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
				-- List's all implementations of symbol under cursor
				bufmap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
				-- Go to definition of the type symbol
				bufmap("n", "go", ":lua vim.lsp.buf.type_definition()<CR>")
				-- List's all the references
				bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
				-- Display's a function's signature information
				bufmap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>")
				-- Renames all references to the symbol under cursor
				bufmap("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>")
				-- List's code actions available at the current cursor position
				bufmap("n", "<F4>", ":lua vim.lsp.buf.code_action()<CR>")
			end,
		})

		-- Language Server's --
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			gopls = {},
			ts_ls = {},
			html = {},
			cssls = {},
			jsonls = {},
		}

		-- Linters & Formatters
		local tools = { "stylua", "prettierd", "gofumpt", "goimports", "eslint_d" }

		local servers_to_install = {}
		for server_name, _ in pairs(servers) do
			table.insert(servers_to_install, server_name)
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = tools,
		})

		mason_lspconfig.setup({
			ensure_installed = servers_to_install,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				local config = servers[server_name] or {}
				lspconfig[server_name].setup(config)
			end,
		})
	end,
}
