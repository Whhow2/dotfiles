local dap = require("dap")
local dapui = require("dapui")
local utils = require("dap.utils")

-- Add listeners to automatically open and close dapui
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

-- vscode-js-debug
require("dap-vscode-js").setup({
  adapters = {
    "pwa-node",
    "pwa-chrome",
    "pwa-msedge",
    "node-terminal",
    "pwa-extensionHost",
  },
})

for _, language in ipairs({
  "typescript",
  "javascript",
  "javascriptreact",
  "typescriptreact",
}) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      name = "TS-Node Launch",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
      runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
    },
    {
      name = "Node Attach",
      type = "pwa-node",
      request = "attach",
      processId = utils.pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      name = "Jest Launch",
      type = "pwa-node",
      request = "launch",
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
    {
      request = "launch",
      name = "Deno launch",
      type = "pwa-node",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = vim.fn.getenv("HOME") .. "/.deno/bin/deno",
      runtimeArgs = { "run", "--inspect-brk", "--allow-all" },
      attachSimplePort = 9229,
    },
    {
      request = "launch",
      name = "Deno test launch",
      type = "pwa-node",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = vim.fn.getenv("HOME") .. "/.deno/bin/deno",
      runtimeArgs = { "test", "--inspect-brk", "--allow-all" },
      attachSimplePort = 9229,
    },
  }
end

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/bin/netcoredbg/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F10>", require("dap").step_over)
vim.keymap.set("n", "<F11>", require("dap").step_into)
vim.keymap.set("n", "<F12>", require("dap").step_out)
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "Dapui close" })
