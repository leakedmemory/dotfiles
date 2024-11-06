-- in case of using html files with some template language
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.html",
  command = "setfiletype html",
})

-- TODO: remove when biome get a formatter
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.html",
  command = "silent! !pnpm prettier % --write"
})
