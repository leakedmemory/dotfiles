local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("CustomGroup", { clear = true })

autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e"
})

autocmd("Filetype", {
  pattern = {
    "lua",
    "yaml",
    "markdown",
    "json",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})

autocmd("Filetype", {
  pattern = {
    "asm",
  },
  callback = function()
    vim.opt_local.shiftwidth = 8
    vim.opt_local.tabstop = 8
  end
})
