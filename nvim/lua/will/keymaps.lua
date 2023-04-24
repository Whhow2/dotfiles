local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- set spacebar as leader key for convenience instead of backslash
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)
keymap("n", "<F6>", ":NvimTreeFocus<cr>", opts)

-- Emmet
vim.g.user_emmet_leader_key = ","
