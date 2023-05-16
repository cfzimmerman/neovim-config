vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search history after enter
keymap.set("n", "x", '"_x') -- deletes a character without copying it to register
keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

keymap.set("n", "<leader>sv", "<C-w>v") -- splits window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- splits window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<leader>qq", ":w<CR>:bd<CR>")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- (un)maximizes current split window

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggles file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files in the project
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text in the project
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- search the current string the cursor on right now
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- show active buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- show help tags

-- Movement
-- "<ctrl>o" -- go back
-- "<ctrl>i" -- jump forward

-- LSP
-- "gd" -- shows definition of imported file
-- "gf" -- show additional info about a term
-- "gi" -- go to implementation of import
-- "]d" -- go to highlighted error
-- "<leader>ca" -- apply suggested code action
-- "<leader>d" -- show error hovered over
-- "K" -- hover documentation
-- "<leader>rn" -- rename text and update usage
-- "<leader>rf" -- rename TS file, update imports
