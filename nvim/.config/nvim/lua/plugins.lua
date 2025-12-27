vim.pack.add({
	"https://github.com/windwp/nvim-autopairs", -- auto close brackets & quotes
	"https://github.com/windwp/nvim-ts-autotag", -- auto close tags
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" }, -- syntax highlighting
	"https://github.com/nvim-tree/nvim-tree.lua", -- file explorer
	{ src = "https://github.com/nvim-mini/mini.icons", version = "stable" }, -- icons
	"https://github.com/nvim-lua/plenary.nvim", -- dependency
	"https://github.com/nvim-telescope/telescope.nvim", -- fuzzy finder
	"https://github.com/nvim-telescope/telescope-ui-select.nvim", -- use telescope ui
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") }, -- completion menu
	"https://github.com/rafamadriz/friendly-snippets", -- snippets
	"https://github.com/folke/tokyonight.nvim", -- theme
	"https://github.com/stevearc/conform.nvim", -- formatting
	"https://github.com/mfussenegger/nvim-lint", -- linting
	"https://github.com/mistweaverco/kulala.nvim", -- http client
	"https://github.com/akinsho/bufferline.nvim", -- bufferline
	"https://github.com/lewis6991/gitsigns.nvim", -- gitsigns
	"https://github.com/nvim-lualine/lualine.nvim", -- statusline
	"https://github.com/nvim-mini/mini.indentscope", -- indentscope
	"https://github.com/MeanderingProgrammer/render-markdown.nvim", -- markdown renderer
	-- LSP --
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/seblyng/roslyn.nvim", -- C# lsp
})
