local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Directory Navigation
keymap("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap("n", "<C-l>", "<C-w>l", opts) -- Navigate Right 

-- Window Management
keymap("n", "<leader>sv", ":vsplit<CR>", opts) -- Vertical Split
keymap("n", "<leader>sh", ":split<CR>", opts) -- Horizontal Split
keymap("n", "<leader>q", ":q<CR>", opts) -- Quit Window
keymap("n", "<leader>w", ":w<CR>", opts) -- Save Buffer

-- Indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
