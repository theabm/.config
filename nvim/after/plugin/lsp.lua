-- Setup language servers.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
-- any server supported by lspconfig can be configured using the setup
-- function which takes the following arguments
-- on_attach: a function which determines the mappings that are available only
-- when the lsp server is attached to the buffer. I dont need to do this as this
-- is done further down below
-- capabilities: the capabilities of the autocompletion engine
-- cmd: the command used to spawn the server.
-- settings: any settings needed to configure the server
-- filetypes: the supported filetypes
-- root_dir: the directory where the server will look
-- single_file_support: whether the server can be active if the file is not
-- part of a project
--
-- As an example, I configure pylsp with (almost) all the setting above,
-- However, a lot of these are default settings and can be ignored.
-- In this case, since I want to use ruff as my linter, I need to disable
-- the linting done by pylsp. Otherwise I would have two linting messages for 
-- each server.
lspconfig.pylsp.setup {
    capabilities = capabilities,
    -- cmd = { "pylsp", "-vvv", "--log-file", "pylsp.log" },
    cmd = { "pylsp" },
    filetypes = { "python" },
    single_file_support = true,
    settings = {
        plugins = {
            pycodestyle = {
                -- linter for style checking
                enabled = false,
            },
            pyflakes = {
                -- linter to detect various errors
                enabled = false,
            },
            mccabe = {
                -- linter for complexity checking
                enabled = false
            },
        }

    }
}
-- Ruff server for super fast linting in python
lspconfig.ruff_lsp.setup {
    capabilities = capabilities,
}

lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>sd', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
