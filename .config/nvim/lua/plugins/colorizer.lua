return {
  "norcalli/nvim-colorizer.lua",
  name = "colorizer.nvim",
  config = function()
    require("colorizer").setup({
      "html",
      "css",
      "markdown",
    }, {
      names = false,
    })
  end,
}
