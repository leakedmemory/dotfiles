vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  command = "silent:!prettier % --write --prose-wrap always"
})
