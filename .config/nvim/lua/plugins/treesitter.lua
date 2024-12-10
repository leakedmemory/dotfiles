return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter.nvim",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- programming languages
        "c",
        "go",
        "gomod",
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
    })
  end,
}
