return {
  "bullets-vim/bullets.vim",
  config = function()
    vim.g.bullets_enabled_file_types = {
      "markdown",
      "text",
    }

    vim.g.bullets_pad_right = false
  end,
}
