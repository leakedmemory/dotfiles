vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- in case of using html files with some language template
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.html",
  command = "setfiletype html",
})
