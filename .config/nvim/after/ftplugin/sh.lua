vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.sh",
  command = "silent:!shfmt -i 4 -w %",
})
