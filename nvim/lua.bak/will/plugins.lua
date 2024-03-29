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
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	--[[ use("kyazdani42/nvim-tree.lua") ]]
	use("nvim-tree/nvim-tree.lua")
	use("mattn/emmet-vim")
	use("xiyaowong/transparent.nvim")
	use("akinsho/toggleterm.nvim")
	use("rcarriga/nvim-notify") -- more pleasing notifications
	use({
		"nvim-lualine/lualine.nvim",
		--[[ requires = { "nvim-tree/nvim-web-devicons", opt = true }, ]]
	})
	use("kylechui/nvim-surround")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		--[[ requires = "nvim-tree/nvim-web-devicons" ]]
	})
	use("lukas-reineke/indent-blankline.nvim")
	use("mechatroner/rainbow_csv")
	--[[ use({ "cameron-wags/rainbow_csv.nvim" }) ]]
	--[[ use({ ]]
	--[[ "glepnir/dashboard-nvim", ]]
	--[[ event = "VimEnter", ]]
	--[[ config = function() ]]
	--[[ 	require("dashboard").setup({ ]]
	--[[ 		-- config ]]
	--[[ 	}) ]]
	--[[ end, ]]
	--[[ requires = { "nvim-tree/nvim-web-devicons" }, ]]
	--[[ }) ]]
	--[[ use({ "glepnir/dashboard-nvim", event = "VimEnter", requires = { "nvim-tree/nvim-web-devicons" } }) ]]
	use({
		"goolord/alpha-nvim",
		--[[ requires = { "nvim-tree/nvim-web-devicons" }, ]]
	})
	use({ "ggandor/leap.nvim", requires = { "tpope/vim-repeat" } })
	use({ "folke/which-key.nvim" })
	use({ "tpope/vim-fugitive" })

	-- colorschemes
	use("lunarvim/Onedarker.nvim")
	use("olimorris/onedarkpro.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("folke/tokyonight.nvim")
	use("danilo-augusto/vim-afterglow")
	use("ayu-theme/ayu-vim")
	use("owickstrom/vim-colors-paramount")
	use("ribru17/bamboo.nvim")
	use("felipec/vim-felipec")
	use("tomasiser/vim-code-dark")
	use("zacanger/angr.vim")
	use("EdenEast/nightfox.nvim")
	use("daschw/leaf.nvim")
	use({ "kartikp10/noctis.nvim", requires = { "rktjmp/lush.nvim" } })
	use("Tsuzat/NeoSolarized.nvim")
	use("sainnhe/sonokai")
	use("ray-x/aurora")
	use("ray-x/starry.nvim")

	-- completion plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	--[[ use {'neoclide/coc.nvim', branch = 'release'} ]]
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
	use({
		"nvimdev/lspsaga.nvim",
	})
	--[[ use({ "OmniSharp/Omnisharp-vim" }) ]]

	-- install telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-project.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-autopairs")
	use({
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	})

	-- git
	use("lewis6991/gitsigns.nvim")

	-- debugging
	use({
		"mfussenegger/nvim-dap",
		requires = {
			{ "rcarriga/nvim-dap-ui" },
			{ "mxsdev/nvim-dap-vscode-js" },
		},
	})
	--[[ use({ ]]
	--[[ 	"microsoft/vscode-js-debug", ]]
	--[[ 	opt = true, ]]
	--[[ 	run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out", ]]
	--[[ }) ]]
	use("mfussenegger/nvim-dap-python")

	-- Automatical setup config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
