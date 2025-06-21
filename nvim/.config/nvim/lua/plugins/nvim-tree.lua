return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimTree = require("nvim-tree")

    nvimTree.setup({
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.o.columns
            local screen_h = vim.o.lines
            local win_w = math.floor(screen_w * 0.6)
            local win_h = math.floor(screen_h * 0.6)
            local win_x = math.floor((screen_w - win_w) / 2)
            local win_y = math.floor((screen_h - win_h) / 2 - 1) -- minus 1 for cmd height

            return {
              relative = "editor",
              border = "rounded",
              width = win_w,
              height = win_h,
              row = win_y,
              col = win_x,
            }
          end,
        },
        width = 30, -- width still matters for internal layout
      },
      renderer = {
        highlight_opened_files = "all",
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}
