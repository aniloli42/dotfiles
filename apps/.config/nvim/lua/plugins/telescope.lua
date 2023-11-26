local map = vim.keymap

local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous"
        },
      }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      find_buffers = {
        theme = "dropdown",
        previewer = false,
      }
    }
  })
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
  keys = {
    map.set("n", "<leader>fk", ":Telescope keymaps<CR>"),
    map.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
    map.set("n", "<leader>ff", ":Telescope find_files<CR>"),
    map.set("n", "<leader>fa", ":Telescope <CR>"),
    map.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
    map.set("n", "<leader>fb", ":Telescope buffers<CR>")
  }
}
