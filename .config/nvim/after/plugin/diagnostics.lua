require('trouble').setup({})

vim.keymap.set("n", "<leader>te", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
