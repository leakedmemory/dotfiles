local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("CustomGroup", { clear = true })

autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

autocmd("BufWritePost", {
  pattern = {
    "*.html",
    "*.css",
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.json",
    "*.yaml",
    "*.md"
  },
  command = "silent:!prettier --write %"
})
