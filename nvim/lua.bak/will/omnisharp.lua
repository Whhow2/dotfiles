local pid = vim.fn.getpid()

local omnisharp_bin = "/home/will/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp"

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end
require("lspconfig").omnisharp.setup({
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	on_attach = on_attach,
})

--[[ local capabilities = require("cmp_nvim_lsp").default_capabilities() ]]
--[[]]
--[[ require("lspconfig")["omnisharp"].setup({ ]]
--[[ 	capabilities = capabilities, ]]
--[[ }) ]]
