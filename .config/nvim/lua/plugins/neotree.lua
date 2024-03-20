return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
		vim.keymap.set("n", "<leader>m", ":Neotree<CR>")
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>")

		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			filesystem = {
				hijack_netrw_behavior = "open_default",
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = {
						"node_modules",
						".git",
					},
				},
			},
		})
	end,
}
