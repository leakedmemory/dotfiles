return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    -- `builtin.find_files` config depends on the .ripgreprc file
    -- following this link's description
    -- <https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file>
    vim.keymap.set("n", "<LEADER>tn", builtin.find_files)

    vim.keymap.set("v", "<LEADER>tl", builtin.grep_string)
    vim.keymap.set("n", "<LEADER>tl", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end,
}
