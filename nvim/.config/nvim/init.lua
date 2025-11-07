-------------
-- Options --
-------------
local o = vim.o

o.number = true
o.relativenumber = true
o.wrap = false
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.scrolloff = 5
o.sidescrolloff = 5
o.signcolumn = "yes"
o.termguicolors = true
o.winborder = "rounded"
o.showmode = false
o.completeopt = "menu,menuone,noselect"
o.timeoutlen = 300

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true

o.smartcase = true
o.ignorecase = true
o.hlsearch = false

o.swapfile = false
o.undofile = true
o.autoread = true

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"

vim.opt.clipboard:append("unnamedplus")

--------------
-- Keybinds --
--------------
local function map(mode, bind, cmd, desc)
	vim.keymap.set(mode, bind, cmd, { silent = true, noremap = true, desc = desc })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal editros shortcuts
map("n", "<leader>w", ":w!<cr>", "Save file")
map("n", "<leader>q", ":q<cr>", "Quit neovim")
map("n", "<leader>a", "ggVG", "Select all")
map("n", "<leader>o", ":update<cr> :source<cr>", "Select all")

-- Yank to EOL
map("n", "Y", "y$", "Yank to end of line")

-- Better paste behavior
map("x", "p", '"_dP', "Paste without yanking")

-- Delete without yanking
map({ "n", "v", "x" }, "x", '"_x', "Delete character without yanking")
map({ "n", "v" }, "<leader>d", '"_d', "Delete without yanking")

-- Remove search highlihgts
map("n", "<leader>h", ":nohl<cr>", "Remove search highlights")

-- Center screen when jumping
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Previous search result (centered)")
map("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half page up (centered)")

-- Buffer navigation
map("n", "L", ":bnext<cr>", "Next buffer")
map("n", "H", ":bprevious<cr>", "Previous buffer")
map("n", "Q", ":bdelete!<cr>", "Close buffer")

-- Tab navigation
map("n", "<leader>tt", ":tabnew<cr>", "Create new tab")
map("n", "<leader>tn", ":tabnext<cr>", "Next tab")
map("n", "<leader>tp", ":tabprevious<cr>", "Previous tab")
map("n", "<leader>tx", ":tabclose<cr>", "Close tab")

-- Split management
map("n", "<leader>sv", ":vsplit<cr>", "Split window vertically")
map("n", "<leader>sh", ":split<cr>", "Split window horizontally")
map("n", "<leader>sx", ":close<cr>", "Close split window")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", "Expand window up")
map("n", "<C-Down>", ":resize +2<CR>", "Expand window down")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Expand window left")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Expand window right")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to bottom window")
map("n", "<C-k>", "<C-w>k", "Move to top window")
map("n", "<C-l>", "<C-w>l", "Move to right window")

-- Terminal
map("t", "<Esc>", "<C-\\><C-N>", "Exit terminal mode")
map("t", "<C-h>", "<C-\\><C-N><C-w>h", "(Terminal) Move to left window")
map("t", "<C-j>", "<C-\\><C-N><C-w>j", "(Terminal) Move to bottom window")
map("t", "<C-k>", "<C-\\><C-N><C-w>k", "(Terminal) Move to up window")
map("t", "<C-l>", "<C-\\><C-N><C-w>l", "(Terminal) Move to right window")

-- Move lines up/down
map("n", "<A-j>", ":m .+1<cr>==", "Move line down")
map("n", "<A-k>", ":m .-2<cr>==", "Move line up")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move selection up")

-- Better indentation in visual mode
map("v", ">", ">gv", "Indent right and reselect")
map("v", "<", "<gv", "Indent left and reselect")

-- File navigation
map("n", "<leader>e", ":Ex<cr>", "Open file explorer")

-- Diagnostic
map("n", "gl", ":lua vim.diagnostic.open_float()<cr>", "Open diagnostic float")

-- Mini.pick
map("n", "<leader>ff", ":Pick files<cr>", "Search files")
map("n", "<leader>fb", ":Pick buffers<cr>", "Search buffers")
map("n", "<leader>fh", ":Pick help<cr>", "Search help")
map("n", "<leader>fg", ":Pick grep_live<cr>", "Search pattern")

-- Keybinds for codecompanion
map("n", "<leader>cc", ":CodeCompanionChat<CR>", "Open code companion")

-------------
-- Plugins --
-------------
vim.pack.add({
	"https://github.com/folke/tokyonight.nvim", -- Theme
	"https://github.com/windwp/nvim-autopairs", -- Auto close brackets
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") }, -- Completion
	"https://github.com/nvim-lua/plenary.nvim", -- Dependency
	"https://github.com/rafamadriz/friendly-snippets", -- Snippets
	"https://github.com/catgoose/nvim-colorizer.lua", -- Colors
	{ src = "https://github.com/nvim-mini/mini.icons", version = "stable" }, -- Icons
	{ src = "https://github.com/nvim-mini/mini.pick", version = "stable" }, -- Fuzzy finder
	"https://github.com/windwp/nvim-ts-autotag", -- Auto close html tags
	"https://github.com/akinsho/toggleterm.nvim", -- Terminal
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" }, -- Syntax highlight
	"https://github.com/lewis6991/gitsigns.nvim", -- Git signs
	"https://github.com/nvimdev/indentmini.nvim", -- Indentline
	"https://github.com/MeanderingProgrammer/render-markdown.nvim", -- render markdown
	-- Folding
	"https://github.com/kevinhwang91/nvim-ufo",
	"https://github.com/kevinhwang91/promise-async",
	-- LSP
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	-- Formatting & Linting
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvimtools/none-ls-extras.nvim",
	-- AI
	"https://github.com/olimorris/codecompanion.nvim", -- Chat
	"https://github.com/Exafunction/windsurf.vim", -- Copletion
	"https://github.com/nvim-lualine/lualine.nvim", -- Status line
  "https://github.com/github/copilot.vim"
})

require("tokyonight").setup({
	transparent = true,
	-- Background styles. Can be "dark", "transparent" or "normal"
	sidebars = "transparent",
	floats = "transparent",
})

vim.cmd.colorscheme("tokyonight")

require("nvim-autopairs").setup({
	check_ts = true,
})

local blink = require("blink.cmp")
blink.setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = {
		preset = "enter",
		["<C-space>"] = {},
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-n>"] = { "snippet_forward", "fallback" },
		["<C-p>"] = { "snippet_backward", "fallback" },
		-- ["<C-e>"] = { "hide" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		list = { selection = { preselect = false } },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		menu = { draw = { columns = { { "kind_icon", "label", gap = 1 }, { "source_name" } } } },
	},

	cmdline = { enabled = false },

	sources = {
		-- providers = { codeium = { name = "Codeium", module = "codeium.blink", async = true, score_offset = -9999 } },
		default = { "buffer", "path", "lsp", "snippets" },
	},

	signature = { enabled = true },
})

-- Setup LSP capabilities
local capabilities = blink.get_lsp_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
vim.lsp.config("*", {
	capabilities = capabilities,
})

require("colorizer").setup({
	filetypes = { "*" },
	lazy_load = false,
	user_default_options = {
		css = true,
		css_fn = true,
		tailwind = true,
	},
})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

require("mini.pick").setup({
	mappings = {
		move_down = "<C-j>",
		move_up = "<C-k>",
	},
})

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})

require("toggleterm").setup({
	size = 20,
	open_mapping = [[<C-`>]],
	direction = "float",
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "html", "css", "javascript", "typescript", "tsx" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "emmet_ls" },
})

require("mason-tool-installer").setup({
	ensure_installed = { "prettierd", "stylua", "eslint_d" },
})

local none_ls = require("null-ls")
local formatter = none_ls.builtins.formatting

none_ls.setup({
	sources = {
		formatter.prettierd,
		formatter.stylua,
		require("none-ls.diagnostics.eslint_d"),
	},
})

require("indentmini").setup()

require("codecompanion").setup({
	opts = {
		log_level = "DEBUG", -- or "TRACE"
	},
})

require("render-markdown").setup({
	file_types = { "markdown", "codecompanion" },
})

require("gitsigns").setup({})

require("ufo").setup()

-- Lualine
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local function mode()
	-- Map of modes to their respective shorthand indicators
	local mode_map = {
		n = "N", -- Normal mode
		i = "I", -- Insert mode
		v = "V", -- Visual mode
		["␖"] = "V", -- Visual block mode
		V = "V", -- Visual line mode
		c = "C", -- Command-line mode
		no = "N", -- NInsert mode
		s = "S", -- Select mode
		S = "S", -- Select line mode
		ic = "I", -- Insert mode (completion)
		R = "R", -- Replace mode
		Rv = "R", -- Virtual Replace mode
		cv = "C", -- Command-line mode
		ce = "C", -- Ex mode
		r = "R", -- Prompt mode
		rm = "M", -- More mode
		["r?"] = "?", -- Confirm mode
		["!"] = "!", -- Shell mode
		t = "T", -- Terminal mode
	}
	-- Return the mode shorthand or [UNKNOWN] if no match
	return mode_map[vim.fn.mode()] or "[UNKNOWN]"
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
	cond = hide_in_width,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local spaces = function()
	return "spaces: " .. vim.bo.shiftwidth
end

require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
	},
	sections = {
		lualine_a = { { mode, separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "filename", "branch" },
		lualine_c = {
			diagnostics,
			-- '%=', --[[ add your center components here in place of this comment ]]
		},
		lualine_x = { diff },
		lualine_y = { spaces, "filetype" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})

---------
-- LSP --
---------
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local keymap = vim.keymap.set
		local lsp = vim.lsp
		local bufopts = { noremap = true, silent = true, buffer = args.buf }

		keymap("n", "K", lsp.buf.hover, bufopts)
		keymap("n", "gr", lsp.buf.references, bufopts)
		keymap("n", "gd", lsp.buf.definition, bufopts)
		keymap("n", "gD", lsp.buf.declaration, bufopts)
		keymap("n", "gi", lsp.buf.implementation, bufopts)
		keymap("n", "go", lsp.buf.type_definition, bufopts)
		keymap("n", "gs", lsp.buf.signature_help, bufopts)
		keymap("n", "<leader>lr", lsp.buf.rename, bufopts)
		keymap("n", "<leader>la", lsp.buf.code_action, bufopts)
		keymap("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end,
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_text = false,
	update_in_insert = false,
	severity_sort = true,
})

------------------
-- Autocommands --
------------------
-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Handle treesitter updates
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Handle nvim-treesitter updates",
	group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
	callback = function(event)
		if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
			vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
			---@diagnostic disable-next-line: param-type-mismatch
			local ok = pcall(vim.cmd, "TSUpdate")
			if ok then
				vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
			else
				vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
			end
		end
	end,
})
