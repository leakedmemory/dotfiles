return {
  "folke/trouble.nvim",
  name = "trouble",
  config = function()
    vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>",
      { silent = true, noremap = true }
    )
  end,
}
