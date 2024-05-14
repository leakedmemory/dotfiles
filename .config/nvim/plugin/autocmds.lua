local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("CustomGroup", { clear = true })

autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e"
})
