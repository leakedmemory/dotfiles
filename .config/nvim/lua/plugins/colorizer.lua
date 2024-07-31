return {
  "norcalli/nvim-colorizer.lua",
  name = "colorizer.nvim",
  config = function()
    require("colorizer").setup({
      "*",
    }, {
      names = false,
    })
  end,
}
