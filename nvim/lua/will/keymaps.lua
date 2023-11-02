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

-- Better saving
keymap("n", "zz", ":update<cr>", opts)
-- save while in insert mode
keymap("i", "<C-z>", "<esc>:update<cr>a", opts)
-- Quit without saving
keymap("n", "zx", "<esc>:q!<cr>", opts)

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>tl", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>tp", "<cmd>Telescope project<cr>", opts)
keymap("n", "<leader>tb", "<cmd>Telescope file_browser<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

-- Emmet
vim.g.user_emmet_leader_key = ","

-- clear search highlighting
keymap("n", "<leader>h", ":noh<cr>", opts)

-- toggle gitui
--[[ keymap("n", "<leader>g", ":lua _GITUI_TOGGLE()<cr>", opts) ]]
--

-- toggle transparency
keymap("n", "<leader>z", "<cmd>TransparentToggle<cr>", opts)

-- macros
vim.fn.setreg("a", "ggVG")
