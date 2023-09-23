-- :help options
local options = {
	background = "dark", -- sets default background color schemekjjjkkkk
	backspace = { "indent", "eol", "start" }, -- allows backspace to continue working when dealing with tabs, lines breaks, and when ctrl-w or ctrl-u are used to swtich panes or windows
	clipboard = "unnamedplus",
	backup = false, -- prevents backup file from being made
	fileencoding = "utf-8", -- default file encoding
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignores case in searches unless uppercase character used
	mouse = "a", -- allows mouse to be used in all vim modes
	pumheight = 10, -- pop menu height
	--[[ showtabline = 2, -- always show tabs ]]
	smartcase = true, -- use smartcase with ignorecase that uppercase characters trigger case sensitive search
	smartindent = true, -- auto indent when starting a new line
	splitbelow = true, -- new horizontal splits go below current window
	splitright = true, -- new vertical splits go to right of current window
	undofile = true, -- enable undo history after file is reopened
	updatetime = 300, -- time in ms for changes to be written to swap file
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- number of spaces for each indentation
	tabstop = 2, -- number of spaces for each tab
	number = true,
	relativenumber = true, -- use relative line numbers
	signcolumn = "yes", -- always show sign column (e.g. breakpoints)
	wrap = false, -- turn off line wrap
	scrolloff = 8, -- keeps some text above or below cursor
	sidescrolloff = 8, -- keeps text on screen for long lines since wrap is off
	completeopt = { "menuone", "noselect" }, -- menuone brings up popup window even if only option so other features are accessible (e.g. definition. noselect doesn't default to a choice. this prevents inadvertent selections.
	termguicolors = true, -- expand color range for terminal
	cursorline = true,
	foldmethod = "indent",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-") -- includes dashes when changing word with ciw or diw
