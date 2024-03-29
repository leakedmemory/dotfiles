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
  },
  name = "lsp",
  config = function()
    local lsp = require("lsp-zero")
    lsp.preset("recommended")

    lsp.on_attach(function(_, bufnr)
      -- availables actions in `:help lsp-zero-keybindings`
      lsp.default_keymaps({ buffer = bufnr })
    end)

    lsp.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ["lua_ls"] = { "lua" },
        ["vimls"] = { "vim" },
        ["clangd"] = { "c", "cpp", "objc", "objcpp" },
        ["rust_analyzer"] = { "rust" },
        ["taplo"] = { "toml" },
        ["yamlls"] = { "yaml" },
        ["pyright"] = { "python" },
      },
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "vimls",
        "rust_analyzer",
        "taplo",
        "yamlls",
        "pyright",
      },
      handlers = {
        lsp.default_setup,
      },
    })

    local cmp = require("cmp")
    local cmp_action = lsp.cmp_action()

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      }),
    })

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
            globals = { "vim" },
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
