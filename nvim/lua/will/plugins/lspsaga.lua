return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        server_filetype_map = {
          typescript = "typescript",
        },
      })

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
      vim.keymap.set("n", "gf", "<Cmd>Lspsaga finder<CR>", opts)
      vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
      --[[ vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts) ]]
      vim.keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
      vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
      vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",  -- optional
    },
  },
}
