local opt = vim.opt

opt.guicursor = ""
opt.termguicolors = true

opt.scrolloff = 8

opt.number = true
opt.relativenumber = true
opt.signcolumn = "no"
opt.colorcolumn = "80,100,120"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.smartcase = true
opt.ignorecase = true

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.updatetime = 50
