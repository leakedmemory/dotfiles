local opt = vim.opt_local

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.foldmethod = "expr"
opt.foldexpr = "vimtex#fold#level(v:lnum)"
opt.foldtext = "vimtex#fold#text()"
opt.foldlevel = 2

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.tex", "*.bib" },
  command = "VimtexCompile",
})

-- setting `,lv` only worked deleting the old command before setting the new one
-- not sure if I'm configuring something wrong
pcall(vim.keymap.del, "n", "<LOCALLEADER>lv", { buffer = 0 })

vim.keymap.set("n", "<LOCALLEADER>lv", function()
  local abs_path = vim.fn.expand('%:p:h') .. "/build/" .. vim.fn.expand("%:t:r") .. ".pdf"
  vim.fn.jobstart("zathura " .. abs_path, { detach = true })
end, { silent = true })
