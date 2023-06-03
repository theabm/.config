vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.8

vim.g.floaterm_wintype = 'float'

vim.keymap.set('n', '<leader>ft', ':FloatermToggle<CR>')
vim.keymap.set('t', '<leader>ft', '<C-\\><C-n>:FloatermToggle<CR>')
