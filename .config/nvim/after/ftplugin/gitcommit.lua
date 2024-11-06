local set = vim.keymap.set

set("n", "<C-k>", "<CMD>move .-2<CR>")
set("n", "<C-j>", "<CMD>move .+1<CR>")
set("v", "<C-k>", "dkP`[V`]")
set("v", "<C-j>", "dp`[V`]")
