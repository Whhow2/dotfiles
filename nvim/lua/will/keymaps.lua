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
--[[ keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts) ]]
keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>tf", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
--[[ keymap("n", "<leader>tf", "<cmd>Telescope live_grep<cr>", opts) ]]
-- Nvimtree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)
keymap("n", "<F5>", ":NvimTreeFocus<cr>", opts)

-- Emmet
vim.g.user_emmet_leader_key = ","

-- clear search highlighting
keymap("n", "<leader>h", ":noh<cr>", opts)

-- toggle gitui
--[[ keymap("n", "<leader>g", ":lua _GITUI_TOGGLE()<cr>", opts) ]]
