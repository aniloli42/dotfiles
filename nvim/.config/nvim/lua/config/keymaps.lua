local key = require("utils.keymap")

key("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
key("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
key("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
key("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
key("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
key("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
key("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
key("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current split" })

key("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
key("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
key("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
key("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
key("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- format whole file
key("n", "<leader>fmt", "<S-g><S-v>gg=<C-o>", { desc = "format whole file" })

-- close nvim
key("n", "<leader>q", "<cmd>q<CR>", { desc = "close nvim" })
key("n", "<leader><S-q>", "<cmd>wqa<CR>", { desc = "close nvim with save all" })
