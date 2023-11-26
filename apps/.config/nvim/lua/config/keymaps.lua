local map = vim.keymap
local opts = { noremap = true, silent = true }

-- Directory Navigation
map.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
map.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)


-- Pane Navigation
map.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
map.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
map.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
map.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right 


