return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          -- always show the preview if space allows
          -- needed because font size 20 is too big to the default config
          preview_cutoff = 1,
        },
      },
      pickers = {
        find_files = {
          -- emacs buffer style
          theme = "ivy",
        },
      },
    })

    local builtin = require("telescope.builtin")

    -- BurntSushi/ripgrep is required for `grep_string` and `live_grep` and is
    -- used as first priority to `find_files`. Because of that, search patterns
    -- depends on the `.ripgreprc` file and follows this link's description
    -- <https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file>
    vim.keymap.set("n", "<LEADER>tn", builtin.find_files)
    vim.keymap.set("n", "<LEADER>tl", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set("v", "<LEADER>tl", builtin.grep_string)
  end,
}
