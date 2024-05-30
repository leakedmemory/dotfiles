return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<LEADER>re",
      "<CMD>Oil<CR>",
    },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end
}
