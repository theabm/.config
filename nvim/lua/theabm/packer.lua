vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Theme
    use 'folke/tokyonight.nvim'

    -- Language Parser
    use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Undotree for better undoing
    use ( 'mbbill/undotree' )

    -- Completion and LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'

    -- Black Formatter for python
    use 'psf/black'

    -- Comment plugin for better commenting abilities
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Float term for floating terminal for quick work
    use 'voldikss/vim-floaterm'

    -- Harpoon for better file movement
    use 'ThePrimeagen/harpoon'

    -- lualine for status bar at the bottom
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Start screen for nvim with most frequent projects 
    use 'mhinz/vim-startify'

    -- Tag bar for function summary
    use 'preservim/tagbar'
    
    -- Git signs to see modifications
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- Indentation
    use "lukas-reineke/indent-blankline.nvim"
    
    -- For markdown highlighting
    -- use {
    --     'lukas-reineke/headlines.nvim',
    --     after = 'nvim-treesitter',
    --     config = function()
    --         require('headlines').setup()
    --     end,
    -- }

    -- Autopairs for parenthesis and bracket completion
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Leap for blazingly fast editing
    use 'ggandor/leap.nvim'

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                            on_the_way_to_10k = "~/on_the_way_to_10k",
                        },
                    },
                },
            },
        }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
    }

    use 'tpope/vim-surround'

end)
