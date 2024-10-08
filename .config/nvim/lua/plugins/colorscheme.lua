return {
  "jesseleite/nvim-noirbuddy",
  name = "noirbuddy.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
  config = function()
    require("noirbuddy").setup({
      preset = "minimal",
    })
  end,
}
