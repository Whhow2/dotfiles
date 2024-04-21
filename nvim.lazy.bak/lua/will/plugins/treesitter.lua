return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "javascript",
          "json",
          "lua",
          "python",
          "typescript",
          "tsx",
          "css",
          "rust",
          "java",
          "yaml",
          "markdown",
          "markdown_inline",
          "c_sharp",
        },                         -- one of "all" or a list of languages
        ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
        highlight = {
          enable = true,           -- false will disable the whole extension
          disable = { "css" },     -- list of language that will be disabled
        },
        autopairs = {
          enable = true,
        },
        autotag = {
          enable = true,
          filetypes = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "css",
            "lua",
            "xml",
            "php",
            "markdown",
          },
        },
        indent = { enable = true, disable = { "python", "css" } },
      })

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end,
  },
}
