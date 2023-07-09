vim.api.nvim_create_autocmd(
  'User',
  {
    pattern = 'VimtexEventInitPost',
    callback = 'vimtex#compiler#compile'
  }
)

vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull', }
vim.g.vimtex_quickfix_open_on_warning = false
vim.g.vimtex_view_method = "zathura"


-- vim.keymap.set("n", "", ":VimtexView<CR>")
-- Ctrl-righclick on zathura -> brings you to corresponding line in code
