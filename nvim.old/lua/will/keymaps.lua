local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- set spacebar as leader key for convenience instead of backslash
keymap("", "<Space>", "<Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
