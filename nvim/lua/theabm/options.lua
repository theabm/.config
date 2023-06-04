vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100

vim.opt.colorcolumn = "80"

-- Concealing text for norg custom links
-- always conceal text
vim.opt.conceallevel = 2
-- set modes in which text is concealed when 
-- cursor line is on top of it. I set it to normal 
-- and command mode. So in insert and visual mode, 
-- text will not be concealed any longer.
vim.opt.concealcursor = "c"
