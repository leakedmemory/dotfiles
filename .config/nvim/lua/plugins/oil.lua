return {
  "stevearc/oil.nvim",
  name = "oil",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    vim.keymap.set("n", "<leader>re", "<CMD>Oil<CR>", { desc = "open parent dir" })
  end
}
