local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("CustomGroup", { clear = true })

autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

autocmd("BufWritePost", {
  pattern = "*.sh",
  command = "silent:!shfmt -i 4 -w %",
})

autocmd("BufWritePost", {
  pattern = "*.py",
  command = "silent:!black %"
})

local function package_json_exists()
  local cwd = vim.fn.getcwd()
  local package_json_path = cwd .. "/package.json"
  return vim.fn.filereadable(package_json_path) == 1
end

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
  callback = function()
    local prettier_cmd = "prettier --write " .. vim.fn.expand("%")
    if package_json_exists() then
      prettier_cmd = "pnpm dlx " .. prettier_cmd
    end
    vim.cmd("silent! !" .. prettier_cmd)
  end,
})

autocmd("BufWritePost", {
  pattern = {
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
  },
  callback = function()
    if package_json_exists() then
      vim.cmd("silent! !pnpm dlx eslint --fix " .. vim.fn.expand("%"))
    end
  end,
})
