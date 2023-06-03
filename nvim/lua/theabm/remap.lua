vim.g.mapleader = " "
vim.g.maplocalleader = "_"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Fix behavior of Y - by deault its the same as yy
-- which is not coherent with behavior of C, D etc which
-- operate from cursor until end of line
vim.keymap.set("n", "Y", "y$")

--faster writing and quitting
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>xx", ":q<CR>")

-- Move text up and down in visual line mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move current line up or down
-- M is alt key
vim.keymap.set("n", "<M-j>", ":move+<CR>")
vim.keymap.set("n", "<M-k>", ":move-2<CR>")

-- Better indenting
vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

-- Better behavior for j
vim.keymap.set("n", "J", "mzJ`z")

-- centering of vertical navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- centering of searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window movement
vim.keymap.set("n", "H", "<C-w>h")
vim.keymap.set("n", "L", "<C-w>l")

-- Window resizing 
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- Separate vim yank and system clipboard yank
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- smart delete by sending to void
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format)

-- Search term under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

