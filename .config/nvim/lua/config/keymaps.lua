vim.g.mapleader = " "

vim.keymap.set("n", "<leader>re", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- mantain selection of text after using < and >
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- move the current line up and down
vim.keymap.set({ "n", "v" }, "<C-k>", ":move .-2<CR>")
vim.keymap.set({ "n", "v" }, "<C-j>", ":move .+1<CR>")

-- delete to the void
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
-- delete to the void and paste
vim.keymap.set("x", "<leader>p", '"_dP')

-- copy to the SO clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
