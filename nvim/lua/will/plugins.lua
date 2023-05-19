local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- install plugins
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- allows packer to manage itself
	use("nvim-lua/popup.nvim") -- Popup API from vim for neovim
	use("nvim-lua/plenary.nvim") -- useful functions for other plugins
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	--[[ use("kyazdani42/nvim-tree.lua") ]]
	use("nvim-tree/nvim-tree.lua")
	use("mattn/emmet-vim")
	use("xiyaowong/transparent.nvim")
	use("akinsho/toggleterm.nvim")
	--[[ use("rcarriga/nvim-notify") -- more pleasing notifications ]]
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- colorschemes
	use("lunarvim/Onedarker.nvim")

	-- completion plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	-- snippet engines
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("neovim/nvim-lspconfig") -- enables LSP
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- install telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- debugging
	--[[ use("mfussenegger/nvim-dap") ]]
	--[[ use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }) ]]
	--[[ use({ ]]
	--[[ 	"microsoft/vscode-js-debug", ]]
	--[[ 	opt = true, ]]
	--[[ 	run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out", ]]
	--[[ }) ]]
	use({
		"mfussenegger/nvim-dap",
		requires = {
			{ "rcarriga/nvim-dap-ui" },
			{ "mxsdev/nvim-dap-vscode-js" },
		},
		--[[ config = function() ]]
		--[[ 	require("will.dap") ]]
		--[[ end, ]]
	})

	-- vimspector
	--	use("puremourning/vimspector")

	-- DAP debugging
	--[[ use { ]]
	--[[   "mfussenegger/nvim-dap", ]]
	--[[   opt = true, ]]
	--[[   module = { "dap" }, ]]
	--[[   requires = { ]]
	--[[     "theHamsta/nvim-dap-virtual-text", ]]
	--[[     "rcarriga/nvim-dap-ui", ]]
	--[[     "mfussenegger/nvim-dap-python", ]]
	--[[     "nvim-telescope/telescope-dap.nvim", ]]
	--[[     { "leoluz/nvim-dap-go", module = "dap-go" }, ]]
	--[[     { "jbyuki/one-small-step-for-vimkind", module = "osv" }, ]]
	--[[     { "mxsdev/nvim-dap-vscode-js" }, ]]
	--[[     { ]]
	--[[       "microsoft/vscode-js-debug", ]]
	--[[       opt = true, ]]
	--[[       run = "npm install --legacy-peer-deps && npm run compile", ]]
	--[[     }, ]]
	--[[   }, ]]
	--[[   config = function() ]]
	--[[     require("will.dap").setup() ]]
	--[[   end, ]]
	--[[   disable = false, ]]
	--[[ } ]]
	-- Automatical setup config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
