vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.sh",
  command = "silent:!shfmt -i 4 -w %",
})
