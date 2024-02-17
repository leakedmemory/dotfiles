require("telescope").setup {
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
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tl', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ts', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
