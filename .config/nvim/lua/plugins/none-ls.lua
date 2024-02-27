return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
        -- formatting
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,

        -- diagnostics
        null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.codespell,

        -- code actions
        null_ls.builtins.code_actions.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
