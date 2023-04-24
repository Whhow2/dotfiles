local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	print("nvim-dap not installed!")
	return
end

local DEBUGGER_PATH = vim.fn.stdpath("data") .. "/site/pack/packer/opt/vscode-js-debug"

local M = {}

require("dap-vscode-js").setup({
	--[[ node_path = "node", ]]
	--[[ debugger_path = DEBUGGER_PATH, ]]
	--[[ -- debugger_cmd = { "js-debug-adapter" }, ]]
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

require("dap").adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = { DEBUGGER_PATH .. "/src/dapDebugServer.ts", "${port}" },
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

return M
