local set = vim.keymap.set

set("n", "<leader>re", vim.cmd.Ex)

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- toggle fold, open all folds, close all folds
set({ "n", "v" }, "<leader>ft", "za")
set({ "n", "v" }, "<leader>fu", "zR")
set({ "n", "v" }, "<leader>fa", "zM")

-- mantain selection of text after using < and >
set("v", ">", ">gv")
set("v", "<", "<gv")

-- move lines up and down
set("n", "<C-k>", ":move .-2<CR>==")
set("n", "<C-j>", ":move .+1<CR>==")
set("v", "<C-k>", "dkP`[V`]=gv")
set("v", "<C-j>", "dp`[V`]=gv")

-- delete to the void
set({ "n", "v" }, "<leader>d", '"_d')
-- delete to the void and paste
set("x", "<leader>p", '"_dP')

-- copy to the SO clipboard
set({ "n", "v" }, "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')
