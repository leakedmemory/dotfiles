return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    -- Neovim Lua API
    "folke/lazydev.nvim",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(_, bufnr)
      -- availables actions in `:help lsp-zero-keybindings`
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)


    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ["lua_ls"] = { "lua" },
        ["vimls"] = { "vim" },
        ["clangd"] = { "c", "cpp", "objc", "objcpp" },
        ["rust_analyzer"] = { "rust" },
        ["asm_lsp"] = { "asm", "s", "S" },
        ["pyright"] = { "py" },
        ["texlab"] = { "tex", "bib" },
      },
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "vimls",
        "rust_analyzer",
        "asm_lsp",
        "pyright",
        "marksman",
        "texlab",
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    local cmp = require("cmp")
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
        ["<C-y>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      }),
    })

    require("lazydev").setup({})

    local lspconfig = require("lspconfig")

    lspconfig.opts = {
      servers = {
        clangd = {
          mason = false,
        },
      },
    }

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim",
            },
          },
        },
      },
    })

    lspconfig.clangd.setup({
      cmd = {
        "clangd-18",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu"
      },
    })
  end,
}
