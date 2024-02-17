require('lohanyrvine.remap')
require('lohanyrvine.set')
require('lohanyrvine.packer')

local augroup = vim.api.nvim_create_augroup('mygroup', {})
local autocmd = vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
