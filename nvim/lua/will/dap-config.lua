local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	print("nvim-dap not installed!")
	return
end

require("dap").set_log_level("INFO") -- Helps when configuring DAP, see logs with :DapShowLog

require("dap").adapters["pwa-node"] = {
	type = "server",
	port = "localhost",
	executable = {
		command = "node",
		args = { vim.fn.stdpath("data") .. "/site/pack/packer/opt/vscode-js-debug/src/vsDebugServer.ts", "${port}" },
	},
}

require("dap").configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}
