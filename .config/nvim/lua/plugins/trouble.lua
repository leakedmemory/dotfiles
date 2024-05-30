return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<LEADER>tr",
      "<CMD>Trouble diagnostics toggle focus=true<CR>",
    },
    {
      "<LEADER>ts",
      "<CMD>Trouble symbols toggle focus=true<CR>",
    },
  },
  opts = {},
}
