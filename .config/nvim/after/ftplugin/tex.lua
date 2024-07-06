local opt = vim.opt_local

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.foldmethod = "expr"
opt.foldexpr = "vimtex#fold#level(v:lnum)"
opt.foldtext = "vimtex#fold#text()"
opt.foldlevel = 2

-- setting `,lv` only worked deleting the old command before setting the new one
-- not sure if I'm configuring something wrong
pcall(vim.keymap.del, "n", "<LOCALLEADER>lv", { buffer = 0 })

vim.keymap.set("n", "<LOCALLEADER>lv", function()
  vim.fn.jobstart("zathura build/" .. vim.fn.expand("%:r") .. ".pdf", { detach = true })
end, { silent = true })
