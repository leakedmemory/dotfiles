require("catppuccin").setup({
    flavour = "latte",
    integrations = {
        harpoon = true,
        mason = true,
        telescope = {
            enabled = true,
        },
    }
})

vim.opt.background = "light"
vim.cmd.colorscheme("catppuccin")
