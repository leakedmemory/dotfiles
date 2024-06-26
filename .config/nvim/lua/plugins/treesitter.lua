return {
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter.nvim",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "c",
      "cpp",
      "make",
      "rust",
      "toml",
      "yaml",
      "python",
      "bash",
      "markdown",
      "markdown_inline",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
