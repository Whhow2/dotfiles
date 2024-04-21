return {
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		config = function()
			local servers = {
				"clangd",
				"cssls",
				"csharp_ls",
				"emmet_ls",
				"eslint",
				"lua_ls",
				"pyright",
				"jsonls",
				"powershell_es",
				"sqlls",
				"tsserver",
				"yamlls",
			}

			local settings = {
				ui = {
					border = "none",
					icons = {
						package_installed = "◍",
						package_pending = "◍",
						package_uninstalled = "◍",
					},
				},
				log_level = vim.log.levels.INFO,
				max_concurrent_installers = 4,
			}

			require("mason").setup(settings)
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_status_ok then
				return
			end

			local opts = {}

			for _, server in pairs(servers) do
				opts = {
					on_attach = require("will.lsp.handlers").on_attach,
					capabilities = require("will.lsp.handlers").capabilities,
				}

				server = vim.split(server, "@")[1]

				local require_ok, conf_opts = pcall(require, "will.lsp." .. server)
				if require_ok then
					opts = vim.tbl_deep_extend("force", conf_opts, opts)
				end

				lspconfig[server].setup(opts)
			end
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			local formatters = { "stylua", "black", "csharpier", "prettierd" }
			require("will.plugins.null-ls") -- require your null-ls config here (example below)
			require("mason-null-ls").setup({
				ensure_installed = formatters,
				automatic_installation = true,
				handlers = {},
			})
		end,
	},
}
