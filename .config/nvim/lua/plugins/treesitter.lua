return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter.nvim",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      -- programming languages
      "c",
      "rust",
      "asm",
      "javascript",
      "jsdoc",

      -- scripting languages
      "lua",
      "python",
      "bash",

      -- markup languages
      "html",
      "css",
      "markdown",
      "markdown_inline",

      -- data serialization
      "toml",
      "json",
      "jsonc",
      "yaml",

      -- other
      "cmake",
      "latex",
      "gitignore",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
