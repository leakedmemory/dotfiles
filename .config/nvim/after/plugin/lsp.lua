local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- availables actions in `:help lsp-zero-keybindings
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['clangd'] = { 'c', 'cpp' },
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'clangd', 'pyright' },
    handlers = {
        lsp_zero.default_setup,
    }
})

local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    formatting = cmp_format,
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
})
