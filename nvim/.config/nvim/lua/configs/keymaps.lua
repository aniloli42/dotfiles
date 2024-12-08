vim.g.mapleader = " "

local k = vim.keymap

k.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
k.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })


-- increment/decrement numbers
k.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
k.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
k.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
k.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
k.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current split" })

k.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
k.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
k.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
k.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
k.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
