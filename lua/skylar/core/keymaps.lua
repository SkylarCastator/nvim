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

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>.rs", ":LspRestart<CR>") -- mapping to restart lsp if nessessary

--Vimspector
keymap.set("n", "<leader>db", ":call vimspector#Launch()<CR>")
keymap.set("n", "<leader>dr", ":call vimspector#Reset()<CR>")
keymap.set("n", "<leader>dc", ":call vimspector#Continue()<CR>")
keymap.set("n", "<leader>dn", ":call vimspector#StepOver()<CR>")
keymap.set("n", "<leader>di", ":call vimspector#StepInto()<CR>")
keymap.set("n", "<leader>do", ":call vimspector#StepOut()<CR>")
keymap.set("n", "<leader>dt", ":call vimspector#ToggleBreakpoint()<CR>")
keymap.set("n", "<leader>dl", ":call vimspector#ClearBreakpoints()<CR>")
