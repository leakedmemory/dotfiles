local set = vim.keymap.set

set("n", "x", '"_x')

set("n", "U", "<C-r>")

-- open link under cursor on browser
set("n", "gx", ":sil !open <cWORD><cr>", { silent = true })

-- center buffer while navigating
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "{", "{zz")
set("n", "}", "}zz")
set("n", "N", "Nzz")
set("n", "n", "nzz")
set("n", "G", "Gzz")
set("n", "%", "%zz")
set("n", "*", "*zz")
set("n", "#", "#zz")

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

-- copy to the OS's clipboard
set({ "n", "v" }, "<leader>y", '"+y')
