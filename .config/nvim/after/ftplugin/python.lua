vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  command = "silent:!black %"
})
