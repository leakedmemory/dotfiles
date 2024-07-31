vim.opt_local.colorcolumn = "72,79"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  command = "silent:!black %"
})
