-- Autocommand to refresh nvim-tree when LazyGit terminal is closed
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*lazygit", -- this matches terminal buffers that include 'lazygit' in their name
  callback = function()
    -- Wait a moment to ensure all FS operations are completed
    vim.defer_fn(function()
      -- This is the command to refresh nvim-tree
      require("nvim-tree.api").tree.reload()
    end, 100) -- delay in ms
  end,
  desc = "Auto-refresh nvim-tree after LazyGit closes",
})
