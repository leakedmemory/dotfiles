return {
  "tpope/vim-commentary",
  name = "commentary",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>gmr", "<Plug>CommentaryLine", { noremap = false })
    vim.api.nvim_set_keymap("x", "<leader>gm", "<Plug>Commentary", { noremap = false })
  end,
}
