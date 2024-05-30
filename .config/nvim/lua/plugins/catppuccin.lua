return {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "latte",
    transparent_background = true,
    integrations = {
      harpoon = true,
      mason = true,
      telescope = { enabled = true },
      lsp_trouble = true,
    },
  },
  config = function()
    vim.opt.background = "light"
    vim.cmd.colorscheme("catppuccin")
  end,
}
