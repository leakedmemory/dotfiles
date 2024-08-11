return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    -- lsp support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- neovim lua api
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
        -- programming languages
        ["clangd"] = { "c", "cpp", "objc", "objcpp" },
        ["rust_analyzer"] = { "rust" },
        ["gopls"] = { "go" },

        -- scripting languages
        ["lua_ls"] = { "lua" },

        -- data serialization
        ["taplo"] = { "toml" },

        --other
        ["neocmake"] = { "CMakeLists.txt", "cmake" },
        ["texlab"] = { "tex", "bib" },
      },
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- programming languages
        "clangd",
        "rust_analyzer",
        "asm_lsp",
        "tsserver",
        "gopls",

        -- scripting languages
        "lua_ls",
        "pyright",
        "bashls",

        -- markup languages
        "html",
        "htmx",
        "cssls",
        "marksman",

        -- data serialization
        "taplo",
        "jsonls",
        "yamlls",

        -- other
        "neocmake",
        "texlab",
        "eslint",
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    local luasnip = require("luasnip")
    luasnip.add_snippets("html", {
      luasnip.snippet("html5", {
        luasnip.text_node("<!doctype html>"),
        luasnip.text_node({ "", "<html lang=\"pt-BR\">" }),
        luasnip.text_node({ "", "  <head>" }),
        luasnip.text_node({ "", "    <meta charset=\"UTF-8\" />" }),
        luasnip.text_node({ "", "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />" }),
        luasnip.text_node({ "", "    <title>Document</title>" }),
        luasnip.text_node({ "", "  </head>" }),
        luasnip.text_node({ "", "  <body>" }),
        luasnip.text_node({ "", "    " }),
        luasnip.insert_node(1),
        luasnip.text_node({ "", "  </body>" }),
        luasnip.text_node({ "", "</html>" }),
      }),
    })

    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
        ["<C-y>"] = cmp.mapping.complete(),
        ["<C-f>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
    })

    require("lazydev").setup({})

    local lspconfig = require("lspconfig")

    lspconfig.opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--header-insertion=iwyu"
          },
        },

        lua_ls = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }

    -- use only eslint's linting
    lspconfig.tsserver.setup({
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
    })
  end,
}
