vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

local function prettier_config_exists()
  local cwd = vim.fn.getcwd()
  local prettier_config_path = cwd .. "/prettier.config.js"
  return vim.fn.filereadable(prettier_config_path) == 1
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    if not prettier_config_exists() then
      vim.cmd("silent! !prettier % --write --prose-wrap always")
    end
  end,
})
