return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {}
}
