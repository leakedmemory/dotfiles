return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "latte",
    transparent_background = true,
    integrations = {
      harpoon = true,
      mason = true,
      telescope = {
        enabled = true,
      },
    },
  },
  config = function()
    vim.opt.background = "light"
    vim.cmd.colorscheme("catppuccin")
  end,
}
