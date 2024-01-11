return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set("n", "<leader><Space>", "<cmd>Telescope find_files<cr>", opts)
      vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", opts)
      vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
      vim.keymap.set("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
      vim.keymap.set("n", "<leader>tl", "<cmd>Telescope buffers<cr>", opts)
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension("project")
      vim.keymap.set("n", "<leader>tp", "<cmd>Telescope project<cr>", opts)
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
      vim.keymap.set("n", "<leader>tb", "<cmd>Telescope file_browser<CR>", opts)
      vim.keymap.set("n", "<leader>b", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
    end,
  }
}
