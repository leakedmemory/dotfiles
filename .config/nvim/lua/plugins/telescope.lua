return {
  "nvim-telescope/telescope.nvim",
  brach = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  name = "telescope",
  opts = {
    defaults = {
      file_ignore_patterns = {
        -- directories
        ".git/",
        ".idea/",
        ".vscode/",
        "target/",
        "obj/",
        "bin/",

        -- files
        ".lock",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>tn", builtin.find_files, {})
    vim.keymap.set("n", "<leader>th", builtin.git_files, {})
    vim.keymap.set("n", "<leader>tl", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end,
}
