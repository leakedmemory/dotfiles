local function prettier_config_exists()
  local cwd = vim.fn.getcwd()
  local prettier_config_path = cwd .. "/.prettierrc.toml"
  return vim.fn.filereadable(prettier_config_path) == 1
end

-- TODO: remove when biome get a formatter
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    if prettier_config_exists() then
      vim.cmd("silent! !pnpm prettier % --write")
    else
      vim.cmd("silent! !prettier % --write --prose-wrap always")
    end
  end,
})
