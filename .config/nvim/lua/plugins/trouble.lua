return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  name = "trouble",
  config = function()
    vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>",
      { silent = true, noremap = true }
    )
  end,
}
