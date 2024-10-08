return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    -- this is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end

    lsp_zero.extend_lspconfig({
      lsp_attach = lsp_attach,
    })

    lsp_zero.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        -- programming languages
        ["clangd"] = { "c", "cpp" },
        ["rust_analyzer"] = { "rust" },
        ["gopls"] = { "go" },
        ["biome"] = {
          "astro",
          "css",
          "graphql",
          "javascript",
          "javascriptreact",
          "json",
          "jsonc",
          "svelte",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
          "vue",
        },

        -- scripting languages
        ["lua_ls"] = { "lua" },
        ["ruff"] = { "python" },

        -- markup languages
        ["templ"] = { "templ" },

        --other
        ["texlab"] = { "tex", "bib" },
      },
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- programming languages
        "clangd",
        "rust_analyzer",
        "gopls",
        "ts_ls", -- js and ts lsp
        "biome", -- web stuff linter and formatter

        -- scripting languages
        "lua_ls",
        "ruff", -- python
        "bashls",

        -- markup languages
        "html",
        "htmx",
        "templ",
        "cssls",
        "marksman",

        -- other
        "texlab",
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })
  end,
}
