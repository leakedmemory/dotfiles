-- in case of using html files with some template language
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.html",
  command = "setfiletype html",
})
