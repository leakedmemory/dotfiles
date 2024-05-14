vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local spec = {
  import = "plugins",
}

local opts = {
  lockfile = vim.fn.stdpath("config") .. "/lazy.lock",
  change_detection = {
    notify = false,
  },
}

require("lazy").setup(spec, opts)
