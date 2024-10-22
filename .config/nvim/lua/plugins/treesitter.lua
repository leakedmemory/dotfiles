return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter.nvim",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      -- programming languages
      "c",
      "rust",
      "go",
      "typescript",
      "javascript",
      "jsdoc",

      -- scripting languages
      "lua",
      "python",
      "bash",

      -- markup languages
      "html",
      "templ",
      "css",
      "markdown",
      "markdown_inline",

      -- data serialization
      "toml",
      "json",
      "jsonc",
      "yaml",

      -- other
      "make",
      "latex",
      "gitignore",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(spec, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
