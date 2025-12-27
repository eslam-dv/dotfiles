local ok, kulala = pcall(require, "kulala")
if not ok then
	return
end

kulala.setup({
	global_keymaps = {
		["Send request"] = { -- sets global mapping
			"<leader>hs",
			function()
				require("kulala").run()
			end,
			mode = { "n", "v" }, -- optional mode, default is n
			desc = "Send request", -- optional description, otherwise inferred from the key
		},
		["Send all requests"] = {
			"<leader>ha",
			function()
				require("kulala").run_all()
			end,
			mode = { "n", "v" },
			ft = "http", -- sets mapping for *.http files only
		},
		["Replay the last request"] = {
			"<leader>hr",
			function()
				require("kulala").replay()
			end,
			ft = { "http", "rest" }, -- sets mapping for specified file types
		},
		["Find request"] = false, -- set to false to disable
	},
})
