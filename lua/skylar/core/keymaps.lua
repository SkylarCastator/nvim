vim.g.mapleader = " "

local keymap = vim.keymap

--general keymaps
keymap.set("i", "jk", "<ESC>") --escape insert mode
keymap.set("n", "<leader>nh", ":nohl<CR>") --escape search mode

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>") --increment number in normal mode
keymap.set("n", "<leader>-", "<C-x>") --increment number in normal mode

keymap.set("n", "<leader>sv", "<C-w>v") --split window virtically
keymap.set("n", "<leader>sh", "<C-w>s") --split horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make split equal
keymap.set("n", "<leader>sx", ":close<CR>") --close current split

keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") --close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --go to previous tab

--plugin keymaps
--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")