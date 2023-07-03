vim.o.timeout = true
vim.o.timeoutlen = 500
local wk = require("which-key")
wk.setup({})

wk.register({
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
		b = { "<cmd>Telescope buffers<cr>", "View buffers" },
		g = { "<cmd>Telescope live_grep<cr>", "Search files for text" },
		c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search current file for text" },
		p = { "<cmd>Telescope project<cr>", "Open recent project" },
	},
}, { prefix = "<leader>" })
