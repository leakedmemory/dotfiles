return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<LEADER>re",
      "<CMD>Oil<CR>",
    },
  },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name, bufnr)
          -- hide files ending with "_templ.go"
          if name:match("_templ%.go$") then
            return true
          end
        end,
      },
    })
  end
}
