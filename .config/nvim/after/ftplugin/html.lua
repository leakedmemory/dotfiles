vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- in case of using html files with some language template
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.html",
  command = "setfiletype html",
})

-- TODO: remove when biome get a formatter
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.html",
  command = "silent! !pnpm prettier % --write"
})
