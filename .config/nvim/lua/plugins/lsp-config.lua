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
					"dockerls",
					"docker_compose_language_service",
					"eslint",
					"marksman",
					"rust_analyzer",
          "yamlls"
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
			-- Lua LSP
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- JS/TS LSP
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			-- html LSP
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			-- Docker LSP
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			-- Docker Compose LSP
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			-- Eslint LSP
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			-- Markdown LSP
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			-- Rust LSP
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			-- YAML LSP
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})


			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
