return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "html",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "gopls",
          "grammarly",
          "graphql",
          "jsonls",
          "marksman",
          "prismals",
          "pyre",
          "rust_analyzer",
          "taplo",
          "tailwindcss",
          "yamlls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities })
      lspconfig.tsserver.setup({ capabilities })
      lspconfig.html.setup({ capabilities })
      lspconfig.cssls.setup({ capabilities })
      lspconfig.dockerls.setup({ capabilities })
      lspconfig.eslint.setup({ capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities })
      lspconfig.gopls.setup({ capabilities })
      lspconfig.grammarly.setup({ capabilities })
      lspconfig.graphql.setup({ capabilities })
      lspconfig.jsonls.setup({ capabilities })
      lspconfig.marksman.setup({ capabilities })
      lspconfig.prismals.setup({ capabilities })
      lspconfig.pyre.setup({ capabilities })
      lspconfig.rust_analyzer.setup({ capabilities })
      lspconfig.taplo.setup({ capabilities })
      lspconfig.tailwindcss.setup({ capabilities })
      lspconfig.yamlls.setup({ capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
