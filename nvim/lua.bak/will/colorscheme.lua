require("onedarkpro").setup({
	styles = {
		types = "NONE",
		methods = "NONE",
		numbers = "NONE",
		strings = "NONE",
		comments = "italic",
		keywords = "bold,italic",
		constants = "NONE",
		functions = "italic",
		operators = "NONE",
		variables = "NONE",
		parameters = "NONE",
		conditionals = "italic",
		virtual_text = "NONE",
	},
})

require("catppuccin").setup({
	--[[ transparent_background = true, ]]
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
})
--
--[[ local colorscheme = "onedarker" ]]
local colorscheme = "catppuccin"
--[[ local colorscheme = "tokyonight-night" ]]
--[[ local colorscheme = "afterglow" ]]
--[[ local colorscheme = "ayu" ]]
--[[ local colorscheme = "angr" ]]
--[[ local colorscheme = "nightfox" ]]
--[[ local colorscheme = "noctis" ]]
--[[ local colorscheme = "NeoSolarized" ]]
--[[ local colorscheme = "sonokai" ]]
--[[ local colorscheme = "aurora" ]]
--[[ vim.g.aurora_transparent = 1 ]]
--[[ local colorscheme = "mariana" ]]
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
